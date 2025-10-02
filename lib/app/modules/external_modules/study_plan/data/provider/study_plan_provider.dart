import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/data/services/external_carteirinha_service.dart';
import 'dart:convert';
import '../../../../../data/services/HTTPService.dart';
import '../../../../../data/services/external_study_plan_service.dart';
import '../models/study_plan_model.dart';
import 'package:get/get.dart';

class StudyPlanProvider {

  Future<StudyPlanModel?> getStudyPlan(bool isRefresh) async {
    StudyPlanModel? plan;
    plan = await _getStudyPlanData("Aluno");
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

  clear() {

  }

  Future<StudyPlanModel?> _getStudyPlanData(String vinculo) async {
    final httpService = Get.find<HTTPService>();

    Uri url = Uri(
      host: 'app.uff.br',
      path: '/umm/api/get_studyplan',
      scheme: 'https',
      queryParameters: {
        'vinculo': vinculo,
        'matricula':
      }
    );

    try {
      final response = await httpService.get(url);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonResponse = jsonDecode(response.body);
          return StudyPlanModel.fromJson(jsonResponse);
        } else {
          debugPrint('StudyPlan api failed.\n Status Code: ${response.statusCode}');
        }
      }
    } catch (e) {
      debugPrint('error -getStudyPlan: $e');
    }
    return null;
  }
}