import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_auth_repository.dart';

class UserAuthController extends GetxController {
  UserAuthController();

  final UserAuthRepository _userAuthRepository = UserAuthRepository();

  Future<String> saveUserAuthModel(UserAuthModel userAuth) async {
    return await _userAuthRepository.saveUserAuthModel(userAuth);
  }

  Future<UserAuthModel?> getUserAuthModel() async {
    return await _userAuthRepository.getUserAuthModel();
  }

  Future<String> deleteUserAuthModel() async {
    return await _userAuthRepository.deleteUserAuthModel();
  }

  Future<String> clearAllUserAuth() async {
    return await _userAuthRepository.clearAllUserAuth();
  }

  Future<bool> hasUserAuth() async {
    return await _userAuthRepository.hasUserAuth();
  }
}
