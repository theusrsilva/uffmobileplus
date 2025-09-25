import 'package:flutter/material.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/provider/user_auth_provider.dart';

class UserAuthRepository {
  final UserAuthProvider _userAuthProvider = UserAuthProvider();

  UserAuthRepository() {
    debugPrint("Creating User Auth Repo");
  }

  Future<String> saveUserIduffModel(UserIduffModel userAuth) async {
    return await _userAuthProvider.saveUserIduffModel(userAuth);
  }

  Future<UserIduffModel?> getUserIduffModel() async {
    return await _userAuthProvider.getUserIduffModel();
  }

  Future<String> deleteUserIduffModel() async {
    return await _userAuthProvider.deleteUserIduffModel();
  }

  Future<String> clearAllUserAuth() async {
    return await _userAuthProvider.clearAllUserAuth();
  }

  Future<bool> hasUserAuth() async {
    return await _userAuthProvider.hasUserAuth();
  }
}
