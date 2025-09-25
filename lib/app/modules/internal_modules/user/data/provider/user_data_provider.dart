import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_data.dart';

class UserDataProvider {
  final String _collectionPath = "user_data";
  final String _userKey = "current_user";

  UserDataProvider() {
    debugPrint("Started User Data provider");
  }

  Future<String> saveUserData(UserData userData) async {
    try {
      var box = await Hive.openBox<UserData>(_collectionPath);
      await box.put(_userKey, userData);
      return "success";
    } catch (e) {
      return "Erro ao salvar dados do usuário no Hive: $e";
    }
  }

  Future<UserData?> getUserData() async {
    try {
      var box = await Hive.openBox<UserData>(_collectionPath);
      return box.get(_userKey);
    } catch (e) {
      throw Exception("Erro ao buscar dados do usuário do Hive: $e");
    }
  }

  Future<String> deleteUserData() async {
    try {
      var box = await Hive.openBox<UserData>(_collectionPath);
      await box.delete(_userKey);
      return "success";
    } catch (e) {
      return "Erro ao deletar dados do usuário do Hive: $e";
    }
  }

  Future<String> clearAllUserData() async {
    try {
      var box = await Hive.openBox<UserData>(_collectionPath);
      await box.clear();
      return "success";
    } catch (e) {
      return "Erro ao limpar dados do usuário do Hive: $e";
    }
  }

  Future<bool> hasUserData() async {
    try {
      var box = await Hive.openBox<UserData>(_collectionPath);
      return box.containsKey(_userKey);
    } catch (e) {
      debugPrint("Erro ao verificar existência de dados do usuário: $e");
      return false;
    }
  }
}
