import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../internal_modules/user/controller/user_data_controller.dart';
import '../../../../internal_modules/user/data/models/user_data.dart';
import '../models/study_plan_model.dart';
import 'package:get/get.dart';

class StudyPlanProvider {
  late UserDataController _userDataController;
  late UserData? _userData;

  StudyPlanProvider() {
    _initialize();
  }

  _initialize() async {
    _userDataController = Get.find<UserDataController>();
    _userData = await _userDataController.getUserData();
  }

  Future<StudyPlanModel?> getStudyPlan(bool isRefresh) async {
    StudyPlanModel? plan;
    String matricula = _userData?.matricula ?? "";
    plan = await _getStudyPlanData();
      if (plan == null) {
        return null;
      }
    // final box = await Hive.openBox<StudyPlanModel>('studyPlan');
    //
    // if (!isRefresh) {
    //   plan = box.get(mat);
    // }
    //
    // if (plan == null) {
    //   plan = await _getStudyPlanData("Aluno");
    //   if (plan == null) {
    //     return null;
    //   }
    //   box.put(mat, plan);
    // }
    return plan;
  }

  Future<StudyPlanModel?> _getStudyPlanData() async {
    final bond = _userData?.bond ?? "";
    final token = _userData?.accessToken ?? "";

    Uri url = Uri(
      host: 'app.uff.br',
      path: '/umm/api/get_studyplan',
      scheme: 'https',
      queryParameters: {
        'vinculo': bond,
      }
    );

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return StudyPlanModel.fromJson(jsonResponse);
      } else {
        debugPrint('StudyPlan api failed.\n Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('error -getStudyPlan: $e');
    }
    return null;
  }

  clear() {

  }
}