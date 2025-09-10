import 'package:flutter/material.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/provider/auth_information_provider.dart';

class AuthInformationRepository {
  final AuthInformationProvider _authInformationProvider =
      AuthInformationProvider();

  AuthInformationRepository() {
    debugPrint("Creating Auth Information Repo");
  }

  Future<String> saveAuthInformation(AuthInformationModel authInfo) async {
    return await _authInformationProvider.saveAuthInformation(authInfo);
  }

  Future<AuthInformationModel?> getAuthInformation() async {
    return await _authInformationProvider.getAuthInformation();
  }

  Future<String> deleteAuthInformation() async {
    return await _authInformationProvider.deleteAuthInformation();
  }

  Future<String> clearAllAuthInformation() async {
    return await _authInformationProvider.clearAllAuthInformation();
  }

  Future<bool> hasAuthInformation() async {
    return await _authInformationProvider.hasAuthInformation();
  }

  Future<String> updateIsLogged(bool isLogged) async {
    return await _authInformationProvider.updateIsLogged(isLogged);
  }

  Future<bool?> getIsLogged() async {
    return await _authInformationProvider.getIsLogged();
  }

  Future<String?> getRefreshToken() async {
    return await _authInformationProvider.getRefreshToken();
  }

  Future<String?> getAuthorizationCode() async {
    return await _authInformationProvider.getAuthorizationCode();
  }

  Future<String?> getCodeVerifier() async {
    return await _authInformationProvider.getCodeVerifier();
  }

  Future<String?> getIduff() async {
    return await _authInformationProvider.getIduff();
  }

  Future<String?> getAccessToken() async {
    return await _authInformationProvider.getAccessToken();
  }
}
