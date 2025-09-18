import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_iduff_model.dart';

class AuthIduffProvider {
  final String _collectionPath = "auth_information_data";
  final String _authKey = "current_auth";

  AuthIduffProvider() {
    debugPrint("Started Auth Iduff provider");
  }

  Future<String> saveAuthInformation(AuthIduffModel authInfo) async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      await box.put(_authKey, authInfo);
      return "success";
    } catch (e) {
      return "Erro ao salvar dados de autenticação no Hive: $e";
    }
  }

  Future<AuthIduffModel?> getAuthInformation() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      return box.get(_authKey);
    } catch (e) {
      throw Exception("Erro ao buscar dados de autenticação do Hive: $e");
    }
  }

  Future<String> deleteAuthInformation() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      await box.delete(_authKey);
      return "success";
    } catch (e) {
      return "Erro ao deletar dados de autenticação do Hive: $e";
    }
  }

  Future<String> clearAllAuthInformation() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      await box.clear();
      return "success";
    } catch (e) {
      return "Erro ao limpar dados de autenticação do Hive: $e";
    }
  }

  Future<bool> hasAuthInformation() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      return box.containsKey(_authKey);
    } catch (e) {
      debugPrint("Erro ao verificar existência de dados de autenticação: $e");
      return false;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      AuthIduffModel? authInfo = box.get(_authKey);
      return authInfo?.refreshToken;
    } catch (e) {
      debugPrint("Erro ao buscar refresh token: $e");
      return null;
    }
  }

  Future<String?> getAuthorizationCode() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      AuthIduffModel? authInfo = box.get(_authKey);
      return authInfo?.authorizationCode;
    } catch (e) {
      debugPrint("Erro ao buscar authorization code: $e");
      return null;
    }
  }

  Future<String?> getCodeVerifier() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      AuthIduffModel? authInfo = box.get(_authKey);
      return authInfo?.codeVerifier;
    } catch (e) {
      debugPrint("Erro ao buscar code verifier: $e");
      return null;
    }
  }

  Future<String?> getIduff() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      AuthIduffModel? authInfo = box.get(_authKey);
      return authInfo?.iduff;
    } catch (e) {
      debugPrint("Erro ao buscar iduff: $e");
      return null;
    }
  }

  Future<String?> getAccessToken() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      AuthIduffModel? authInfo = box.get(_authKey);
      return authInfo?.accessToken;
    } catch (e) {
      debugPrint("Erro ao buscar access token: $e");
      return null;
    }
  }

  Future<String> updateIsLogged(bool isLogged) async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );

      // Busca o registro atual
      AuthIduffModel? authInfo = box.get(_authKey);

      if (authInfo == null) {
        return "Nenhuma informação de autenticação encontrada";
      }

      // Cria uma nova instância com o isLogged atualizado
      AuthIduffModel updatedAuthInfo = AuthIduffModel(
        iduff: authInfo.iduff,
        refreshToken: authInfo.refreshToken,
        accessToken: authInfo.accessToken,
        authorizationCode: authInfo.authorizationCode,
        codeVerifier: authInfo.codeVerifier,
        isLogged: isLogged, // Novo valor
      );

      // Salva o registro atualizado
      await box.put(_authKey, updatedAuthInfo);
      return "success";
    } catch (e) {
      return "Erro ao atualizar status de login no Hive: $e";
    }
  }

  Future<bool?> getIsLogged() async {
    try {
      Box<AuthIduffModel> box = await Hive.openBox<AuthIduffModel>(
        _collectionPath,
      );
      AuthIduffModel? authInfo = box.get(_authKey);
      return authInfo?.isLogged;
    } catch (e) {
      debugPrint("Erro ao buscar status de login: $e");
      return null;
    }
  }
}
