import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_iduff_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_iduff_repository.dart';

class UserIduffController extends GetxController {
  UserIduffController();

  final UserIduffRepository _userIduffRepository = UserIduffRepository();

  Future<String> saveUserIduffModel(UserIduffModel userIduff) async {
    return await _userIduffRepository.saveUserIduffModel(userIduff);
  }

  Future<UserIduffModel?> getUserIduffModel() async {
    return await _userIduffRepository.getUserIduffModel();
  }

  Future<String> deleteUserIduffModel() async {
    return await _userIduffRepository.deleteUserIduffModel();
  }

  Future<String> clearAllUserIduff() async {
    return await _userIduffRepository.clearAllUserIduff();
  }

  Future<bool> hasUserAuth() async {
    return await _userIduffRepository.hasUserAuth();
  }

  Future<String> updateIsLogged(bool isLogged) async {
    return await _userIduffRepository.updateIsLogged(isLogged);
  }

  Future<bool?> getIsLogged() async {
    return await _userIduffRepository.getIsLogged();
  }

  Future<String?> getAccessToken() {
    return _userIduffRepository.getAccessToken();
  }

  Future<String?> getRefreshToken() {
    return _userIduffRepository.getRefreshToken();
  }

  Future<String?> getCodeVerifier() {
    return _userIduffRepository.getCodeVerifier();
  }

  Future<String?> getAuthorizationCode() {
    return _userIduffRepository.getAuthorizationCode();
  }

  Future<String?> getIduff() {
    return _userIduffRepository.getIduff();
  }

  Future<String?> getPhotoUrl() async {
    return await _userIduffRepository.getPhotoUrl();
  }
}
