import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_auth_repository.dart';

class UserAuthController extends GetxController {
  UserAuthController();

  final UserAuthRepository _userAuthRepository = UserAuthRepository();

  Future<String> saveUserIduffModel(UserIduffModel userAuth) async {
    return await _userAuthRepository.saveUserIduffModel(userAuth);
  }

  Future<UserIduffModel?> getUserIduffModel() async {
    return await _userAuthRepository.getUserIduffModel();
  }

  Future<String> deleteUserIduffModel() async {
    return await _userAuthRepository.deleteUserIduffModel();
  }

  Future<String> clearAllUserAuth() async {
    return await _userAuthRepository.clearAllUserAuth();
  }

  Future<bool> hasUserAuth() async {
    return await _userAuthRepository.hasUserAuth();
  }
}
