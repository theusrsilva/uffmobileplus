import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';

class UserAuthProvider {
  final String _collectionPath = "user_auth_data";
  final String _authKey = "current_auth"; // Chave fixa

  UserAuthProvider() {
    debugPrint("Started User Auth provider");
  }

  // functions for CRUD operations on UserAuthModel in Hive database
  Future<String> saveUserAuthModel(UserAuthModel userAuth) async {
    try {
      var box = await Hive.openBox<UserAuthModel>(_collectionPath);
      await box.put(_authKey, userAuth);
      return "success";
    } catch (e) {
      return "Erro ao salvar dados do usuário no Hive: $e";
    }
  }

  Future<UserAuthModel?> getUserAuthModel() async {
    try {
      var box = await Hive.openBox<UserAuthModel>(_collectionPath);
      return box.get(_authKey);
    } catch (e) {
      throw Exception("Erro ao buscar dados do usuário do Hive: $e");
    }
  }

  Future<String> deleteUserAuthModel() async {
    try {
      var box = await Hive.openBox<UserAuthModel>(_collectionPath);
      await box.delete(_authKey);
      return "success";
    } catch (e) {
      return "Erro ao deletar dados do usuário do Hive: $e";
    }
  }

  Future<String> clearAllUserAuth() async {
    try {
      var box = await Hive.openBox<UserAuthModel>(_collectionPath);
      await box.clear();
      return "success";
    } catch (e) {
      return "Erro ao limpar dados do usuário do Hive: $e";
    }
  }

  Future<bool> hasUserAuth() async {
    try {
      var box = await Hive.openBox<UserAuthModel>(_collectionPath);
      return box.containsKey(_authKey);
    } catch (e) {
      debugPrint("Erro ao verificar existência de dados do usuário: $e");
      return false;
    }
  }
}
