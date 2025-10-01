import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import '../../../../../data/services/HTTPService.dart';
import '../models/study_plan_model.dart';
import 'package:get/get.dart';

class StudyPlanProvider {
  final _box = Hive.box<StudyPlanModel>();

  Future<StudyPlanModel?> getStudyPlan(bool isRefresh) async {
    StudyPlanModel? plan;

    if (!isRefresh) {
      plan = _box.get('studyPlan');
    }

    if (plan == null) {
      plan = await _getStudyPlanData();
      if (plan == null) {
        return null;
      }
      _box.put(reg, plan);
    }
    return plan;
  }

  clear() {

  }

  Future<StudyPlanModel?> _getStudyPlanData() async {
    HTTPService httpService = Get.find<HTTPService>();

    Uri url = Uri(
      host: 'app.uff.br',
      path: '/umm/v2/umplus/get_studyplan',
      scheme: 'https',
      queryParameters: {
        //'vinculo': Get.find<UserRepository>().getVinculacao()
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