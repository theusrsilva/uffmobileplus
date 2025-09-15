import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:uffmobileplus/app/config/secrets.dart';
import 'package:uffmobileplus/app/data/services/HTTPService.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/utils/auth_client.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_auth_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';

enum KeycloakEnvironment { homologacao, production }

class OAuth2Info {
  String appId;
  String authUrl;
  String tokenUrl;
  AuthorizationServiceConfiguration authServiceConfig;

  OAuth2Info({
    required this.appId,
    required this.tokenUrl,
    required this.authUrl,
    required this.authServiceConfig,
  });
}

class Auth {
  final FlutterAppAuth appAuth = FlutterAppAuth();
  bool isAuthenticated = false;

  final AuthController _authController = Get.find<AuthController>();
  final UserAuthController _userAuthController = Get.find<UserAuthController>();

  AuthenticatedClient? client;

  late KeycloakEnvironment keycloakEnv;
  Map<KeycloakEnvironment, OAuth2Info> keycloakInfo = {
    KeycloakEnvironment.homologacao: OAuth2Info(
      appId: Secrets.homologacaoClientId,
      authUrl: Secrets.homologacaoAuthUrl,
      tokenUrl: Secrets.homologacaoTokenUrl,
      authServiceConfig: const AuthorizationServiceConfiguration(
        authorizationEndpoint: Secrets.homologacaoAuthUrl,
        tokenEndpoint: Secrets.homologacaoTokenUrl,
        endSessionEndpoint: Secrets.homologacaoLogoutUrl,
      ),
    ),
    KeycloakEnvironment.production: OAuth2Info(
      appId: Secrets.productionClientId,
      authUrl: Secrets.productionAuthUrl,
      tokenUrl: Secrets.productionTokenUrl,
      authServiceConfig: const AuthorizationServiceConfiguration(
        authorizationEndpoint: Secrets.productionAuthUrl,
        tokenEndpoint: Secrets.productionTokenUrl,
        endSessionEndpoint: Secrets.productionLogoutUrl,
      ),
    ),
  };

  Auth() {
    if (kReleaseMode) {
      keycloakEnv = KeycloakEnvironment.production;
    } else {
      keycloakEnv = KeycloakEnvironment.production;
    }
  }

  Future<bool> authenticate(BuildContext? context) async {
    isAuthenticated = await authorize();
    return isAuthenticated;
  }

  Future<bool> authorize() async {
    TokenResponse? tokenResponse;
    AuthorizationResponse? authorizationResponse;
    //SharedUser? sharedUser = GetIt.I<SharedUser>();
    debugPrint("calling authorize");
    try {
      //Troca o refresh token por um novo access token quando o atual expira, sem precisar fazer login completo novamente.
      if (await _authController.getRefreshToken() != null) {
        tokenResponse = await _getNewAccessToken();

        if (tokenResponse != null) {
          // sharedUser.refreshToken = tokenResponse!.refreshToken;
          debugPrint("Refreshed Token!");
        }
      }

      //Se nao tiver refresh token, ou se o refresh token ja tiver expirado, faz o login de novo
      if (tokenResponse == null) {
        debugPrint("Primeiro Acesso!");

        authorizationResponse = await _getAuthorization();
        if (authorizationResponse == null) return false;

        tokenResponse = await _getAccessToken(authorizationResponse);
        if (tokenResponse == null) return false;

        debugPrint("Passou pelo novo acesso");
      }
    } catch (e) {
      debugPrint("error on authorize: $e");
      return false;
    }

    // Essas linhas configuram o sistema para que todas as futuras chamadas às APIs da UFF sejam automaticamente autenticadas
    client = AuthenticatedClient({
      "Authorization": "Bearer ${tokenResponse.accessToken}",
    });
    Get.put(HTTPService(this), permanent: true);

    //sharedUser.accessToken = tokenResponse.accessToken;

    return _setInfo(tokenResponse, authorizationResponse);
  }

  //Esta função é responsável por iniciar o processo de autenticação OAuth2 com o servidor Keycloak da UFF
  //Abre a tela de login e retorna a resposta de autorização
  Future<AuthorizationResponse?> _getAuthorization() async {
    AuthorizationResponse? authorizationResponse;
    try {
      authorizationResponse = await appAuth.authorize(
        AuthorizationRequest(
          keycloakInfo[keycloakEnv]!.appId,
          Secrets.redirectUri,
          additionalParameters: {"grant_type": "authorization_code"},
          promptValues: ['login'],
          serviceConfiguration: keycloakInfo[keycloakEnv]!.authServiceConfig,
          scopes: Secrets.authScopes,
        ),
      );

      return authorizationResponse;
    } catch (e) {
      debugPrint("ERRO NO getAuthorization: $e");
    }

    return authorizationResponse;
  }

  // Esta função é responsável por trocar o código de autorização recebido na etapa anterior por tokens de acesso e atualização
  Future<TokenResponse?> _getAccessToken(
    AuthorizationResponse authorizationResponse,
  ) async {
    TokenResponse? tokenResponse;
    try {
      tokenResponse = await appAuth.token(
        TokenRequest(
          keycloakInfo[keycloakEnv]!.appId,
          Secrets.redirectUri,
          authorizationCode: authorizationResponse.authorizationCode,
          codeVerifier: authorizationResponse.codeVerifier,
          nonce: authorizationResponse.nonce,
          serviceConfiguration: keycloakInfo[keycloakEnv]!.authServiceConfig,
          scopes: Secrets.authScopes,
        ),
      );

      return tokenResponse;
    } catch (e) {
      debugPrint("Erro no getAccess: $e");
    }

    return tokenResponse;
  }

  // Esta função tenta renovar o token de acesso usando o token de atualização armazenado
  //Renova automaticamente o access token usando o refresh token salvo, mantendo o usuário logado.
  Future<bool> refreshToken() async {
    TokenResponse? tokenResponse;

    if (await _authController.getRefreshToken() == null) return false;

    tokenResponse = await _getNewAccessToken();

    if (tokenResponse == null) return false;

    // Essas linhas configuram o sistema para que todas as futuras chamadas às APIs da UFF sejam automaticamente autenticadas
    client = AuthenticatedClient({
      "Authorization": "Bearer ${tokenResponse.accessToken}",
    });
    Get.put(HTTPService(this), permanent: true);
    return _setInfo(tokenResponse, null);
  }

  Future<bool> _setInfo(
    TokenResponse tokenResponse,
    AuthorizationResponse? authorizationResponse,
  ) async {
    try {
      Map<String, dynamic> userInfo = await getUserInfo(
        tokenResponse.accessToken,
      );

      String iduff = userInfo["email"];

      // Criar e salvar AuthInformationModel
      AuthInformationModel authInfo = AuthInformationModel(
        accessToken: tokenResponse.accessToken,
        refreshToken: tokenResponse.refreshToken,
        accessTokenExpiration:
            tokenResponse.accessTokenExpirationDateTime!.millisecondsSinceEpoch,
        codeVerifier: authorizationResponse?.codeVerifier,
        authorizationCode: authorizationResponse?.authorizationCode,
        isLogged: true,
        iduff: iduff,
      );

      String authResult = await _authController.saveAuthInformation(authInfo);
      if (authResult != "success") {
        debugPrint("Erro ao salvar AuthInformation: $authResult");
      }

      // Criar e salvar UserAuthModel
      UserAuthModel userAuth = UserAuthModel(
        iduff: iduff,
        fullName: userInfo["name"] ?? '-',
        email: userInfo["email"],
        photoUrl: _assemblePhotoUrl(),
        registration: userInfo["registration"] ?? '-',
        vinculacao: userInfo["vinculacao"] ?? '-',
      );

      String userResult = await _userAuthController.saveUserAuthModel(userAuth);
      if (userResult != "success") {
        debugPrint("Erro ao salvar UserAuth: $userResult");
      }
      return true;
    } catch (e) {
      debugPrint("ERRO EM Authorize: $e");
      return false;
    }
  }

  // Esta função tenta renovar o token de acesso usando o token de atualização armazenado
  Future<TokenResponse?> _getNewAccessToken() async {
    TokenResponse? tokenResponse;
    try {
      tokenResponse = await appAuth.token(
        TokenRequest(
          keycloakInfo[keycloakEnv]!.appId,
          Secrets.redirectUri,
          grantType: 'refresh_token',
          refreshToken: await _authController.getRefreshToken(),
          authorizationCode: await _authController.getAuthorizationCode(),
          codeVerifier: await _authController.getCodeVerifier(),
          serviceConfiguration: keycloakInfo[keycloakEnv]!.authServiceConfig,
          scopes: Secrets.authScopes,
        ),
      );
    } on PlatformException catch (e) {
      if (e.message ==
              "Failed to get token: [error: invalid_grant, description: Refresh token expired]" ||
          e.code == "token_failed") {
        return null;
      } else {
        rethrow;
      }
    }
    return tokenResponse;
  }

  Future<Map<String, dynamic>> getUserInfo(token) async {
    client = AuthenticatedClient({"Authorization": "Bearer $token"});
    var baseUrl = Secrets.homologacaoBaseUrl;
    if (keycloakEnv == KeycloakEnvironment.production) {
      baseUrl = Secrets.productionBaseUrl;
    }
    var uri = Uri.https(baseUrl, Secrets.userInfoPath);
    http.Response response = await client!.get(uri);

    if (response.statusCode == 200) {
      debugPrint("user info:");
      debugPrint(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get UserInfo');
    }
  }

  String _assemblePhotoUrl() {
    return "${Secrets.userPhotoBaseUrl}/${_authController.getIduff()}";
  }

  Future<bool> tryLogin() async {
    TokenResponse? tokenResponse;
    try {
      String? refreshToken = await _authController.getRefreshToken();
      if (refreshToken == null) return false;
      tokenResponse = await _getNewAccessToken();
      debugPrint("Access Token $tokenResponse!!!!!!!!!");
    } on PlatformException catch (e) {
      if (e.message ==
          "Failed to get token: [error: null, description: Network error]") {
        return true;
      }
    }
    if (tokenResponse == null) return false;
    Get.put(HTTPService(this), permanent: true);
    return _setInfo(tokenResponse, null);
  }
}
