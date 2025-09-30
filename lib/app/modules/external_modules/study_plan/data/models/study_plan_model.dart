import 'package:hive/hive.dart';

part 'study_plan_model.g.dart';

@HiveType(typeId: 3)
class StudyPlanModel {
  @HiveField(0)
  Plan? plan;

  StudyPlanModel({this.plan});

  StudyPlanModel.fromJson(Map<String, dynamic> json) {
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 4)
class Plan {
  @HiveField(0)
  Days? dias;

  Plan({this.dias});

  Plan.fromJson(Map<String, dynamic> json) {
    dias = json['dias'] != null ? Days.fromJson(json['dias']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dias != null) {
      data['dias'] = this.dias!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 5)
class Days {
  @HiveField(0)
  Day? segunda;
  @HiveField(1)
  Day? terca;
  @HiveField(2)
  Day? quarta;
  @HiveField(3)
  Day? quinta;
  @HiveField(4)
  Day? sexta;
  @HiveField(5)
  Day? sabado;

  Days(
      {this.segunda,
        this.terca,
        this.quarta,
        this.quinta,
        this.sexta,
        this.sabado});

  Days.fromJson(Map<String, dynamic> json) {
    segunda = json['segunda'] != null ? Day.fromJson(json['segunda']) : null;
    terca = json['terca'] != null ? Day.fromJson(json['terca']) : null;
    quarta = json['quarta'] != null ? Day.fromJson(json['quarta']) : null;
    quinta = json['quinta'] != null ? Day.fromJson(json['quinta']) : null;
    sexta = json['sexta'] != null ? Day.fromJson(json['sexta']) : null;
    sabado = json['sabado'] != null ? Day.fromJson(json['sabado']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.segunda != null) {
      data['segunda'] = this.segunda!.toJson();
    }
    if (this.terca != null) {
      data['terca'] = this.terca!.toJson();
    }
    if (this.quarta != null) {
      data['quarta'] = this.quarta!.toJson();
    }
    if (this.quinta != null) {
      data['quinta'] = this.quinta!.toJson();
    }
    if (this.sexta != null) {
      data['sexta'] = this.sexta!.toJson();
    }
    if (this.sabado != null) {
      data['sabado'] = this.sabado!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 6)
class Day {
  @HiveField(0)
  List<DisciplinasPlanoEstudos>? disciplinas;

  Day({this.disciplinas});

  Day.fromJson(Map<String, dynamic> json) {
    if (json['disciplinas'] != null) {
      disciplinas = <DisciplinasPlanoEstudos>[];
      json['disciplinas'].forEach((v) {
        disciplinas!.add(new DisciplinasPlanoEstudos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.disciplinas != null) {
      data['disciplinas'] = this.disciplinas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 7)
class DisciplinasPlanoEstudos {
  @HiveField(0)
  String? codigoDisciplina;
  @HiveField(1)
  String? codigoTurma;
  @HiveField(2)
  String? horarioInicio;
  @HiveField(3)
  String? horarioFim;
  @HiveField(4)
  String? nome;
  @HiveField(5)
  String? status;

  DisciplinasPlanoEstudos(
      {this.codigoDisciplina,
        this.codigoTurma,
        this.horarioInicio,
        this.horarioFim,
        this.nome,
        this.status});

  DisciplinasPlanoEstudos.fromJson(Map<String, dynamic> json) {
    codigoDisciplina = json['codigo_disciplina'];
    codigoTurma = json['codigo_turma'];
    horarioInicio = json['horario_inicio'];
    horarioFim = json['horario_fim'];
    nome = json['nome'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo_disciplina'] = this.codigoDisciplina;
    data['codigo_turma'] = this.codigoTurma;
    data['horario_inicio'] = this.horarioInicio;
    data['horario_fim'] = this.horarioFim;
    data['nome'] = this.nome;
    data['status'] = this.status;
    return data;
  }
}
