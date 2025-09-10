import 'package:flutter/material.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/provider/user_auth_provider.dart';

class UserAuthRepository {
  final UserAuthProvider _userAuthProvider = UserAuthProvider();

  UserAuthRepository() {
    debugPrint("Creating User Auth Repo");
  }

  Future<String> saveUserAuthModel(UserAuthModel userAuth) async {
    return await _userAuthProvider.saveUserAuthModel(userAuth);
  }

  Future<UserAuthModel?> getUserAuthModel() async {
    return await _userAuthProvider.getUserAuthModel();
  }

  Future<String> deleteUserAuthModel() async {
    return await _userAuthProvider.deleteUserAuthModel();
  }

  Future<String> clearAllUserAuth() async {
    return await _userAuthProvider.clearAllUserAuth();
  }

  Future<bool> hasUserAuth() async {
    return await _userAuthProvider.hasUserAuth();
  }
}
