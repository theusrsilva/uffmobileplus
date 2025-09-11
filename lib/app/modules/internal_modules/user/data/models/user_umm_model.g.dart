// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_umm_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserUmmModelAdapter extends TypeAdapter<UserUmmModel> {
  @override
  final int typeId = 2;

  @override
  UserUmmModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserUmmModel(
      grad: fields[0] as Grad?,
      pos: fields[1] as Pos?,
      activeBond: fields[2] as ActiveBond?,
    );
  }

  @override
  void write(BinaryWriter writer, UserUmmModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.grad)
      ..writeByte(1)
      ..write(obj.pos)
      ..writeByte(2)
      ..write(obj.activeBond);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserUmmModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GradAdapter extends TypeAdapter<Grad> {
  @override
  final int typeId = 3;

  @override
  Grad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Grad(
      matriculas: (fields[0] as List?)?.cast<Matriculas>(),
      nome: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Grad obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.matriculas)
      ..writeByte(1)
      ..write(obj.nome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MatriculasAdapter extends TypeAdapter<Matriculas> {
  @override
  final int typeId = 4;

  @override
  Matriculas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Matriculas(
      id: fields[0] as BigInt?,
      matricula: fields[1] as String?,
      statusMatricula: fields[2] as String?,
      chCursada: fields[3] as int?,
      chTotal: fields[4] as int?,
      codigoCurso: fields[6] as int?,
      nomeCurso: fields[7] as String?,
      idstatusaluno: fields[8] as int?,
      idsituacaoaluno: fields[9] as int?,
      idcurso: fields[10] as int?,
      idlocalidade: fields[11] as int?,
      statusAlunoDesc: fields[12] as String?,
      situacaoAlunoDesc: fields[13] as String?,
      anoIngresso: fields[14] as int?,
      semestreIngresso: fields[15] as int?,
      coeficienterendimento: fields[16] as String?,
      codigoemec: fields[17] as int?,
      curriculos: (fields[18] as List?)?.cast<Curriculos>(),
      curriculo: fields[19] as Curriculos?,
      polo: fields[20] as dynamic,
      identificacao: fields[21] as Identificacao?,
    )..porcentagem_cursada = fields[5] as double?;
  }

  @override
  void write(BinaryWriter writer, Matriculas obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.matricula)
      ..writeByte(2)
      ..write(obj.statusMatricula)
      ..writeByte(3)
      ..write(obj.chCursada)
      ..writeByte(4)
      ..write(obj.chTotal)
      ..writeByte(5)
      ..write(obj.porcentagem_cursada)
      ..writeByte(6)
      ..write(obj.codigoCurso)
      ..writeByte(7)
      ..write(obj.nomeCurso)
      ..writeByte(8)
      ..write(obj.idstatusaluno)
      ..writeByte(9)
      ..write(obj.idsituacaoaluno)
      ..writeByte(10)
      ..write(obj.idcurso)
      ..writeByte(11)
      ..write(obj.idlocalidade)
      ..writeByte(12)
      ..write(obj.statusAlunoDesc)
      ..writeByte(13)
      ..write(obj.situacaoAlunoDesc)
      ..writeByte(14)
      ..write(obj.anoIngresso)
      ..writeByte(15)
      ..write(obj.semestreIngresso)
      ..writeByte(16)
      ..write(obj.coeficienterendimento)
      ..writeByte(17)
      ..write(obj.codigoemec)
      ..writeByte(18)
      ..write(obj.curriculos)
      ..writeByte(19)
      ..write(obj.curriculo)
      ..writeByte(20)
      ..write(obj.polo)
      ..writeByte(21)
      ..write(obj.identificacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatriculasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurriculosAdapter extends TypeAdapter<Curriculos> {
  @override
  final int typeId = 5;

  @override
  Curriculos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Curriculos(
      chTotal: fields[0] as int?,
      chObrigatoriaObtida: fields[1] as int?,
      chEletivaObtida: fields[2] as int?,
      integralizado: fields[3] as dynamic,
      chOptativaObtida: fields[4] as int?,
      identificador: fields[5] as String?,
      chAtividadeComplementar: fields[6] as int?,
      crMaximo: fields[8] as double?,
      crMediana: fields[9] as double?,
      datavinculacao: fields[12] as String?,
    )
      ..chExtensao = fields[7] as int?
      ..chLivreObrigatoria = fields[10] as int?
      ..chObtidaTotal = fields[11] as int?;
  }

  @override
  void write(BinaryWriter writer, Curriculos obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.chTotal)
      ..writeByte(1)
      ..write(obj.chObrigatoriaObtida)
      ..writeByte(2)
      ..write(obj.chEletivaObtida)
      ..writeByte(3)
      ..write(obj.integralizado)
      ..writeByte(4)
      ..write(obj.chOptativaObtida)
      ..writeByte(5)
      ..write(obj.identificador)
      ..writeByte(6)
      ..write(obj.chAtividadeComplementar)
      ..writeByte(7)
      ..write(obj.chExtensao)
      ..writeByte(8)
      ..write(obj.crMaximo)
      ..writeByte(9)
      ..write(obj.crMediana)
      ..writeByte(10)
      ..write(obj.chLivreObrigatoria)
      ..writeByte(11)
      ..write(obj.chObtidaTotal)
      ..writeByte(12)
      ..write(obj.datavinculacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurriculosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IdentificacaoAdapter extends TypeAdapter<Identificacao> {
  @override
  final int typeId = 6;

  @override
  Identificacao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Identificacao(
      iduff: fields[0] as String?,
      nome: fields[1] as String?,
      nomesocial: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Identificacao obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.iduff)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.nomesocial);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentificacaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PosAdapter extends TypeAdapter<Pos> {
  @override
  final int typeId = 7;

  @override
  Pos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pos(
      alunos: (fields[0] as List?)?.cast<Alunos>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pos obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.alunos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlunosAdapter extends TypeAdapter<Alunos> {
  @override
  final int typeId = 8;

  @override
  Alunos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alunos(
      matricula: fields[0] as String?,
      nome: fields[1] as String?,
      cursoNome: fields[2] as String?,
      descricao: fields[3] as String?,
      situacao: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Alunos obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.matricula)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.cursoNome)
      ..writeByte(3)
      ..write(obj.descricao)
      ..writeByte(4)
      ..write(obj.situacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlunosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActiveBondAdapter extends TypeAdapter<ActiveBond> {
  @override
  final int typeId = 9;

  @override
  ActiveBond read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActiveBond(
      objects: fields[0] as Objects?,
    );
  }

  @override
  void write(BinaryWriter writer, ActiveBond obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.objects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActiveBondAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ObjectsAdapter extends TypeAdapter<Objects> {
  @override
  final int typeId = 10;

  @override
  Objects read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Objects(
      outerObject: (fields[0] as List?)?.cast<OuterObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, Objects obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.outerObject);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OuterObjectAdapter extends TypeAdapter<OuterObject> {
  @override
  final int typeId = 11;

  @override
  OuterObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OuterObject(
      usuario: fields[0] as Usuario?,
      innerObjects: (fields[1] as List?)?.cast<InnerObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, OuterObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.usuario)
      ..writeByte(1)
      ..write(obj.innerObjects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OuterObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UsuarioAdapter extends TypeAdapter<Usuario> {
  @override
  final int typeId = 12;

  @override
  Usuario read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usuario(
      id: fields[0] as String?,
      nome: fields[1] as String?,
      cpf: fields[2] as String?,
      ddd: fields[3] as String?,
      tel: fields[4] as String?,
      rg: fields[5] as String?,
      iduff: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Usuario obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.cpf)
      ..writeByte(3)
      ..write(obj.ddd)
      ..writeByte(4)
      ..write(obj.tel)
      ..writeByte(5)
      ..write(obj.rg)
      ..writeByte(6)
      ..write(obj.iduff);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsuarioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InnerObjectAdapter extends TypeAdapter<InnerObject> {
  @override
  final int typeId = 13;

  @override
  InnerObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InnerObject(
      vinculacao: fields[0] as Vinculacao?,
    );
  }

  @override
  void write(BinaryWriter writer, InnerObject obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.vinculacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InnerObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VinculacaoAdapter extends TypeAdapter<Vinculacao> {
  @override
  final int typeId = 14;

  @override
  Vinculacao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vinculacao(
      id: fields[0] as String?,
      matricula: fields[1] as String?,
      localidadeId: fields[2] as String?,
      vinculoId: fields[3] as String?,
      vinculo: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Vinculacao obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.matricula)
      ..writeByte(2)
      ..write(obj.localidadeId)
      ..writeByte(3)
      ..write(obj.vinculoId)
      ..writeByte(4)
      ..write(obj.vinculo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VinculacaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
