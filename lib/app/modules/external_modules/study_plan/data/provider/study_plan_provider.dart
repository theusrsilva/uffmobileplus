import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uffmobileplus/app/data/services/external_study_plan_service.dart';
import '../models/study_plan_model.dart';
import 'package:get/get.dart';

class StudyPlanProvider {
  final ExternalStudyPlanService _studyPlanService = Get
      .find<ExternalStudyPlanService>();

  Future<StudyPlanModel?> getStudyPlan(bool isRefresh) async {
    final box = await Hive.openBox<StudyPlanModel>('studyPlan');
    String matricula = _studyPlanService.getUserMatricula();
    StudyPlanModel? plan;

    if (!isRefresh) {
      plan = box.get(matricula);
    }

    if (plan == null) {
      plan = await _getStudyPlanData();
      if (plan == null) {
        return null;
      }
      box.put(matricula, plan);
    }
    return plan;
  }

  Future<StudyPlanModel?> _getStudyPlanData() async {
    final bond = _studyPlanService.getUserBond();
    final iduff = _studyPlanService.getUserIdUFF();
    final token = await _studyPlanService.getAccessToken();

    Uri url = Uri(
      host: 'app.uff.br',
      path: '/umm/v2/umplus/get_studyplan',
      scheme: 'https',
      queryParameters: {
        'iduff': iduff,
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
}