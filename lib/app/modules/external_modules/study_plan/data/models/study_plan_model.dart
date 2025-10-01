import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/modules/external_modules/study_plan/data/models/discipline_model.dart';

class StudyPlanModel {
  @HiveField(0)
  Map<WeekDay, List<Discipline>?>? plan;

  StudyPlanModel({this.plan});

  StudyPlanModel.fromJson(Map<String, dynamic> json) {
    if (json['plan'] == null) {
      plan = null;
      return;
    }

    for (var day in WeekDay.values) {
      final data = json['plan']['dias'];
      plan?[day] = _getDisciplinesByDay(data[day.description]);
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

enum WeekDay {
  monday ("segunda"),
  tuesday ("terca"),
  wednesday ("quarta"),
  thursday ("quinta"),
  friday ("sexta"),
  saturday ("sabado");

  final String description;
  const WeekDay(this.description);
}