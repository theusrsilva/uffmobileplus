import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart' as http;
import 'package:uffmobileplus/app/config/secrets.dart';
import 'package:uffmobileplus/app/data/services/HTTPService.dart';

import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_umm_model.dart';

class UserDataApi {

  Future<UserUmmModel> getUserData(String? idUFF) async {
   
    Uri url = Uri(
      host: Secrets.productionBaseUrl,
      path: Secrets.getUserDataUrl,
      scheme: Secrets.deepLinkScheme,
      queryParameters: {
        "iduff": idUFF,
        "password": Secrets.passwordForApi,
      }
    );
      
    try {

      http.Response? apiResponse = (await Get.find<HTTPService>().get(url)) as Response?;

      if (apiResponse == null) return UserUmmModel();

      if (apiResponse.statusCode != 200){
        debugPrint("ERROR WITH API. CODE: ${apiResponse.statusCode}\n BODY: ${apiResponse.body}");
      } 
      final userJson = jsonDecode(apiResponse.body);
      return UserUmmModel.fromJson(userJson);
      
    } catch (e) {
      debugPrint("ERROR -getUserData $e");
      return UserUmmModel();
    }
  }
}