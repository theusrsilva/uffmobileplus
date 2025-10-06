import 'package:hive/hive.dart';

part 'discipline_model.g.dart';

@HiveType(typeId: 20)
class Discipline extends HiveObject {
  @HiveField(0)
  String? cod;
  @HiveField(1)
  String? codClass;
  @HiveField(2)
  String? startTime;
  @HiveField(3)
  String? endTime;
  @HiveField(4)
  String? title;
  @HiveField(5)
  String? status;

  Discipline({
    this.cod,
    this.codClass,
    this.startTime,
    this.endTime,
    this.title,
    this.status
  });

  Discipline.fromJson(Map<String, dynamic> json) {
    cod = json['codigo_disciplina'];
    codClass = json['codigo_turma'];
    startTime = json['horario_inicio'];
    endTime = json['horario_fim'];
    title = json['nome'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigo_disciplina'] = cod;
    data['codigo_turma'] = codClass;
    data['horario_inicio'] = startTime;
    data['horario_fim'] = endTime;
    data['nome'] = title;
    data['status'] = status;
    return data;
  }
}