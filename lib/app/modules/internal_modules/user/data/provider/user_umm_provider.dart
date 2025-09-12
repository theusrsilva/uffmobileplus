import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart' as http;
import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/config/secrets.dart';
import 'package:uffmobileplus/app/data/services/HTTPService.dart';

import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_umm_model.dart';

class UserUMMProvider {
  final String _ummCollectionPath = "user_umm_data";
  final String _ummKey = "current_umm";

  Future<UserUmmModel> getUserData(String? idUFF) async {
    Uri url = Uri(
      host: Secrets.productionBaseUrl,
      path: Secrets.getUserDataUrl,
      scheme: Secrets.deepLinkScheme,
      queryParameters: {"iduff": idUFF, "password": Secrets.passwordForApi},
    );

    try {
      http.Response? apiResponse =
          (await Get.find<HTTPService>().get(url)) as Response?;

      if (apiResponse == null) return UserUmmModel();

      if (apiResponse.statusCode != 200) {
        debugPrint(
          "ERROR WITH API. CODE: ${apiResponse.statusCode}\n BODY: ${apiResponse.body}",
        );
      }
      final userJson = jsonDecode(apiResponse.body);
      return UserUmmModel.fromJson(userJson);
    } catch (e) {
      debugPrint("ERROR -getUserData $e");
      return UserUmmModel();
    }
  }

  Future<String> saveUserUmmModel(UserUmmModel userUmm) async {
    try {
      var box = await Hive.openBox<UserUmmModel>(_ummCollectionPath);
      await box.put(_ummKey, userUmm);
      return "success";
    } catch (e) {
      return "Erro ao salvar dados do UserUmmModel no Hive: $e";
    }
  }

  Future<UserUmmModel?> getUserUmmModel() async {
    try {
      var box = await Hive.openBox<UserUmmModel>(_ummCollectionPath);
      return box.get(_ummKey);
    } catch (e) {
      throw Exception("Erro ao buscar dados do UserUmmModel do Hive: $e");
    }
  }

  Future<String> deleteUserUmmModel() async {
    try {
      var box = await Hive.openBox<UserUmmModel>(_ummCollectionPath);
      await box.delete(_ummKey);
      return "success";
    } catch (e) {
      return "Erro ao deletar dados do UserUmmModel do Hive: $e";
    }
  }

  Future<String> clearAllUserUmm() async {
    try {
      var box = await Hive.openBox<UserUmmModel>(_ummCollectionPath);
      await box.clear();
      return "success";
    } catch (e) {
      return "Erro ao limpar dados do UserUmmModel do Hive: $e";
    }
  }

  Future<bool> hasUserUmm() async {
    try {
      var box = await Hive.openBox<UserUmmModel>(_ummCollectionPath);
      return box.containsKey(_ummKey);
    } catch (e) {
      debugPrint("Erro ao verificar existência de dados do UserUmmModel: $e");
      return false;
    }
  }
}
