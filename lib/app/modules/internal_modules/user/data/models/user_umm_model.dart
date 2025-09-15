import 'package:hive/hive.dart';
part 'user_umm_model.g.dart';

@HiveType(typeId: 2)
class UserUmmModel extends HiveObject  {

  @HiveField(0)
  Grad? grad;
  @HiveField(1)
  Pos? pos;
  @HiveField(2)
  ActiveBond? activeBond;

 UserUmmModel({this.grad, this.pos, this.activeBond});

  UserUmmModel.fromJson(Map<String, dynamic> json) {
    grad = json['grad'] != null ? Grad.fromJson(json['grad']) : null;
    pos = json['pos'] != null ? Pos.fromJson(json['pos']) : null;
    activeBond = json['active_bond'] != null
        ? new ActiveBond.fromJson(json['active_bond'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.grad != null) {
      data['grad'] = this.grad!.toJson();
    }
    if (this.pos != null) {
      data['pos'] = this.pos!.toJson();
    }
    if (this.activeBond != null) {
      data['active_bond'] = this.activeBond!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 3)
class Grad {
  @HiveField(0)
  List<Matriculas>? matriculas;
  @HiveField(1)
  String? nome;

  Grad({this.matriculas, this.nome});

  Grad.fromJson(Map<String, dynamic> json) {
    if (json['matriculas'] != null) {
      matriculas = <Matriculas>[];
      json['matriculas'].forEach((v) {
        matriculas!.add(new Matriculas.fromJson(v));
      });
    }
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.matriculas != null) {
      data['matriculas'] = this.matriculas!.map((v) => v.toJson()).toList();
    }
    data['nome'] = this.nome;
    return data;
  }
}

@HiveType(typeId: 4)
class Matriculas {

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? matricula;

  @HiveField(2)
  String? statusMatricula;

  @HiveField(3)
  int? chCursada;

  @HiveField(4)
  int? chTotal;

  @HiveField(5)
  double? porcentagem_cursada;

  @HiveField(6)
  int? codigoCurso;

  @HiveField(7)
  String? nomeCurso;

  @HiveField(8)
  int? idstatusaluno;

  @HiveField(9)
  int? idsituacaoaluno;
  
  @HiveField(10)
  int? idcurso;

  @HiveField(11)
  int? idlocalidade;

  @HiveField(12)
  String? statusAlunoDesc;

  @HiveField(13)
  String? situacaoAlunoDesc;

  @HiveField(14)
  int? anoIngresso;

  @HiveField(15)
  int? semestreIngresso;

  @HiveField(16)
  String? coeficienterendimento;

  @HiveField(17)
  int? codigoemec;

  @HiveField(18)
  List<Curriculos>? curriculos;

  @HiveField(19)
  Curriculos? curriculo;

  @HiveField(20)
  dynamic polo;

  @HiveField(21)
  Identificacao? identificacao;

  Matriculas(
      {this.id,
        this.matricula,
        this.statusMatricula,
        this.chCursada,
        this.chTotal,
        this.codigoCurso,
        this.nomeCurso,
        this.idstatusaluno,
        this.idsituacaoaluno,
        this.idcurso,
        this.idlocalidade,
        this.statusAlunoDesc,
        this.situacaoAlunoDesc,
        this.anoIngresso,
        this.semestreIngresso,
        this.coeficienterendimento,
        this.codigoemec,
        this.curriculos,
        this.curriculo,
        this.polo,
        this.identificacao});

  Matriculas.fromJson(Map<String, dynamic> json) {
    // debugPrint("INSIDE Matriculas with: $json");
    id = json['id'];
    matricula = json['matricula'];
    statusMatricula = json['status_matricula'];
    chCursada = json['ch_cursada'];
    chTotal = json['ch_total'];
    codigoCurso = json['codigo_curso'];
    nomeCurso = json['nome_curso'];
    idstatusaluno = json['idstatusaluno'];
    idsituacaoaluno = json['idsituacaoaluno'];
    idcurso = json['idcurso'];
    idlocalidade = json['idlocalidade'];
    statusAlunoDesc = json['status_aluno_desc'];
    situacaoAlunoDesc = json['situacao_aluno_desc'];
    anoIngresso = json['ano_ingresso'];
    semestreIngresso = json['semestre_ingresso'];
    coeficienterendimento = json['coeficienterendimento'];
    codigoemec = json['codigoemec'];
    if (json['curriculos'] != null) {
      curriculos = <Curriculos>[];
      json['curriculos'].forEach((v) {
        curriculos!.add(new Curriculos.fromJson(v));
      });
    }
    curriculo = json['curriculo'] != null
        ? new Curriculos.fromJson(json['curriculo'])
        : null;
    polo = json['polo'];
    identificacao = json['identificacao'] != null
        ? new Identificacao.fromJson(json['identificacao'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricula'] = this.matricula;
    data['status_matricula'] = this.statusMatricula;
    data['ch_cursada'] = this.chCursada;
    data['ch_total'] = this.chTotal;
    data['codigo_curso'] = this.codigoCurso;
    data['nome_curso'] = this.nomeCurso;
    data['idstatusaluno'] = this.idstatusaluno;
    data['idsituacaoaluno'] = this.idsituacaoaluno;
    data['idcurso'] = this.idcurso;
    data['idlocalidade'] = this.idlocalidade;
    data['status_aluno_desc'] = this.statusAlunoDesc;
    data['situacao_aluno_desc'] = this.situacaoAlunoDesc;
    data['ano_ingresso'] = this.anoIngresso;
    data['semestre_ingresso'] = this.semestreIngresso;
    data['coeficienterendimento'] = this.coeficienterendimento;
    data['codigoemec'] = this.codigoemec;
    if (this.curriculos != null) {
      data['curriculos'] = this.curriculos!.map((v) => v.toJson()).toList();
    }
    if (this.curriculo != null) {
      data['curriculo'] = this.curriculo!.toJson();
    }
    data['polo'] = this.polo;
    if (this.identificacao != null) {
      data['identificacao'] = this.identificacao!.toJson();
    }
    return data;
  }
  
}

@HiveType(typeId: 5)
class Curriculos {
  @HiveField(0)
  int? chTotal;
  @HiveField(1)
  int? chObrigatoriaObtida;
  @HiveField(2)
  int? chEletivaObtida;
  @HiveField(3)
  dynamic integralizado;
  @HiveField(4)
  int? chOptativaObtida;
  @HiveField(5)
  String? identificador;
  @HiveField(6)
  int? chAtividadeComplementar;
  @HiveField(7)
  int? chExtensao;
  @HiveField(8)
  double? crMaximo;
  @HiveField(9)
  double? crMediana;
  @HiveField(10)
  int? chLivreObrigatoria;
  @HiveField(11)
  int? chObtidaTotal;
  @HiveField(12)
  String? datavinculacao;

  Curriculos(
      {this.chTotal,
        this.chObrigatoriaObtida,
        this.chEletivaObtida,
        this.integralizado,
        this.chOptativaObtida,
        this.identificador,
        this.chAtividadeComplementar,
        this.crMaximo,
        this.crMediana,
        this.datavinculacao});

  Curriculos.fromJson(Map<String, dynamic> json) {
    // debugPrint("INSIDE CURRICULOS with: $json");
    chTotal = json['ch_total'];
    chObrigatoriaObtida = json['ch_obrigatoria_obtida'];
    chEletivaObtida = json['ch_eletiva_obtida'];
    integralizado = json['integralizado'];
    chOptativaObtida = json['ch_optativa_obtida'];
    identificador = json['identificador'];
    chAtividadeComplementar = json['ch_atividade_complementar'];
    crMaximo = json['cr_maximo'];
    crMediana = json['cr_mediana'];
    datavinculacao = json['datavinculacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ch_total'] = this.chTotal;
    data['ch_obrigatoria_obtida'] = this.chObrigatoriaObtida;
    data['ch_eletiva_obtida'] = this.chEletivaObtida;
    data['integralizado'] = this.integralizado;
    data['ch_optativa_obtida'] = this.chOptativaObtida;
    data['identificador'] = this.identificador;
    data['ch_atividade_complementar'] = this.chAtividadeComplementar;
    data['cr_maximo'] = this.crMaximo;
    data['cr_mediana'] = this.crMediana;
    data['datavinculacao'] = this.datavinculacao;
    return data;
  }
}

@HiveType(typeId: 6)
class Identificacao {
  @HiveField(0)
  String? iduff;
  @HiveField(1)
  String? nome;
  @HiveField(2)
  String? nomesocial;

  Identificacao({this.iduff, this.nome, this.nomesocial});

  Identificacao.fromJson(Map<String, dynamic> json) {
    iduff = json['iduff'];
    nome = json['nome'];
    nomesocial = json['nomesocial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iduff'] = this.iduff;
    data['nome'] = this.nome;
    data['nomesocial'] = this.nomesocial;
    return data;
  }
}

@HiveType(typeId: 7)
class Pos {
  @HiveField(0)
  List<Alunos>? alunos;

  Pos({this.alunos});

  Pos.fromJson(Map<String, dynamic> json) {
    // debugPrint("INSIDE POS with: $json");
    if (json['alunos'] != null) {
      // debugPrint("Json alunos dif from null");
      alunos = <Alunos>[];
      json['alunos'].forEach((v) {
        alunos!.add(new Alunos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.alunos != null) {
      data['alunos'] = this.alunos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 8)
class Alunos {
  @HiveField(0)
  String? matricula;
  @HiveField(1)
  String? nome;
  @HiveField(2)
  String? cursoNome;
  @HiveField(3)
  String? descricao;
  @HiveField(4)
  String? situacao;

  Alunos(
      {this.matricula,
        this.nome,
        this.cursoNome,
        this.descricao,
        this.situacao});

  Alunos.fromJson(Map<String, dynamic> json) {
    // debugPrint("INSIDE ALUNOS with: $json");
    matricula = json['matricula'];
    nome = json['nome'];
    cursoNome = json['curso_nome'];
    descricao = json['descricao'];
    situacao = json['situacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    data['curso_nome'] = this.cursoNome;
    data['descricao'] = this.descricao;
    data['situacao'] = this.situacao;
    return data;
  }
}

@HiveType(typeId: 9)
class ActiveBond {
  @HiveField(0)
  Objects? objects;

  ActiveBond({this.objects});

  ActiveBond.fromJson(Map<String, dynamic> json) {
    objects = json['objects'] != null ? new Objects.fromJson(json['objects']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.objects != null) {
      data['objects'] = this.objects!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 10)
class Objects {
  @HiveField(0)
  List<OuterObject>? outerObject;

  Objects({this.outerObject});

  Objects.fromJson(Map<String, dynamic> json) {
    if (json['object'] != null) {
      //debugPrint("OUTER_OBJECT: $json");
      outerObject = <OuterObject>[];
      json['object'].forEach((v) {
        outerObject!.add(new OuterObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.outerObject != null) {
      data['object'] = this.outerObject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 11)
class OuterObject {
  @HiveField(0)
  Usuario? usuario;
  @HiveField(1)
  List<InnerObject>? innerObjects;

  OuterObject({this.usuario, this.innerObjects});

  OuterObject.fromJson(Map<String, dynamic> json) {
    usuario =
    json['usuario'] != null ? new Usuario.fromJson(json['usuario']) : null;
    if (json['object'] != null) {
      //TODO: Make the innerObject always a list
      innerObjects = <InnerObject>[];
      try {
        if (json['object'] is List){
          json['object'].forEach((v) {
            // debugPrint("OBJECT ON FOREACH $v");
            innerObjects!.add(new InnerObject.fromJson(v));
          });
        }
        else{
          innerObjects!.add(InnerObject.fromJson(json['object']));
        }
      } catch (e) {
        // debugPrint("ERROR on -OUTEROBJECT: $e");
      }

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuario != null) {
      data['usuario'] = this.usuario!.toJson();
    }
    if (this.innerObjects != null) {
      data['object'] = this.innerObjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 12)
class Usuario {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nome;
  @HiveField(2)
  String? cpf;
  @HiveField(3)
  String? ddd;
  @HiveField(4)
  String? tel;
  @HiveField(5)
  String? rg;
  @HiveField(6)
  String? iduff;

  Usuario(
      {this.id, this.nome, this.cpf, this.ddd, this.tel, this.rg, this.iduff});

  Usuario.fromJson(Map<String, dynamic> json) {
    // debugPrint("INSIDE USUARO with: $json");
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    ddd = json['ddd'];
    tel = json['tel'];
    rg = json['rg'];
    iduff = json['iduff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['ddd'] = this.ddd;
    data['tel'] = this.tel;
    data['rg'] = this.rg;
    data['iduff'] = this.iduff;
    return data;
  }
}

@HiveType(typeId: 13)
class InnerObject {
  @HiveField(0)
  Vinculacao? vinculacao;

  InnerObject({this.vinculacao});

  InnerObject.fromJson(Map<String, dynamic> json) {
    vinculacao = json['vinculacao'] != null
        ? new Vinculacao.fromJson(json['vinculacao'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vinculacao != null) {
      data['vinculacao'] = this.vinculacao!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 14)
class Vinculacao {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? matricula;
  @HiveField(2)
  String? localidadeId;
  @HiveField(3)
  String? vinculoId;
  @HiveField(4)
  String? vinculo;

  Vinculacao(
      {this.id,
        this.matricula,
        this.localidadeId,
        this.vinculoId,
        this.vinculo});

  Vinculacao.fromJson(Map<String, dynamic> json) {
    // debugPrint("INSIDE VINCULACAO with: $json");
    id = json['id'];
    matricula = json['matricula'];
    localidadeId = json['localidade_id'];
    vinculoId = json['vinculo_id'];
    vinculo = json['vinculo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricula'] = this.matricula;
    data['localidade_id'] = this.localidadeId;
    data['vinculo_id'] = this.vinculoId;
    data['vinculo'] = this.vinculo;
    return data;
  }
}