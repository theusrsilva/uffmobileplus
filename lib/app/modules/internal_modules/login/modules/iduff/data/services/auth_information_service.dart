import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/repository/auth_information_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/services/auth.dart';

class AuthInformationService extends GetxService {
  final AuthInformationRepository _authInformationRepository =
      Get.find<AuthInformationRepository>();
      
    Auth get _auth => Get.find<Auth>();

  AuthInformationService() {
    debugPrint("Creating Auth Information Service");
  }

  Future<String> saveAuthInformation(AuthInformationModel authInfo) async {
    return await _authInformationRepository.saveAuthInformation(authInfo);
  }

  Future<AuthInformationModel?> getAuthInformation() async {
    return await _authInformationRepository.getAuthInformation();
  }

  Future<String> deleteAuthInformation() async {
    return await _authInformationRepository.deleteAuthInformation();
  }

  Future<String> clearAllAuthInformation() async {
    return await _authInformationRepository.clearAllAuthInformation();
  }

  Future<bool> hasAuthInformation() async {
    return await _authInformationRepository.hasAuthInformation();
  }

  Future<String> updateIsLogged(bool isLogged) async {
    return await _authInformationRepository.updateIsLogged(isLogged);
  }

  Future<bool?> getIsLogged() async {
    return await _authInformationRepository.getIsLogged();
  }

  Future<String?> getAccessToken() {
    return _authInformationRepository.getAccessToken();
  }

  Future<String?> getRefreshToken() {
    return _authInformationRepository.getRefreshToken();
  }

  Future<String?> getCodeVerifier() {
    return _authInformationRepository.getCodeVerifier();
  }

  Future<String?> getAuthorizationCode() {
    return _authInformationRepository.getAuthorizationCode();
  }

  Future<String?> getIduff() {
    return _authInformationRepository.getIduff();
  }

  Future<bool> tryLogin() async {
    return await _auth.tryLogin();
  }
}
