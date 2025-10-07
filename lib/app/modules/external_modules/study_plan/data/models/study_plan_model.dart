import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/modules/external_modules/study_plan/data/models/discipline_model.dart';
import 'package:uffmobileplus/app/modules/external_modules/study_plan/data/models/weekday_model.dart';

part 'study_plan_model.g.dart';

@HiveType(typeId: 21)
class StudyPlanModel extends HiveObject {
  @HiveField(0)
  Map<WeekDay, List<Discipline>?>? plan;

  StudyPlanModel({this.plan});

  StudyPlanModel.fromJson(Map<String, dynamic> json) {
    if (json['plan'] == null) {
      plan = null;
      return;
    }

    plan = {};
    for (var day in WeekDay.values) {
      final data = json['plan']['dias'];
      final list = _getDisciplinesByDay(data[day.description]);
      plan![day] = list;
    }
  }

  List<Discipline>? _getDisciplinesByDay(Map<String, dynamic> json) {
    List<Discipline> disciplines = [];

    if (json['disciplinas'] != null) {
      json['disciplinas'].forEach((value) {
        disciplines.add(Discipline.fromJson(value));
      });
    }

    return disciplines;
  }
}