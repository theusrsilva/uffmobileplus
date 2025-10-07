// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 18;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      name: fields[0] as String?,
      nomesocial: fields[1] as String?,
      matricula: fields[2] as String?,
      iduff: fields[3] as String?,
      curso: fields[4] as String?,
      fotoUrl: fields[5] as String?,
      dataValidadeMatricula: fields[6] as String?,
      bond: fields[7] as String?,
      textoQrCodeCarteirinha: fields[8] as String?,
      accessToken: fields[9] as String?,
      bondId: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.nomesocial)
      ..writeByte(2)
      ..write(obj.matricula)
      ..writeByte(3)
      ..write(obj.iduff)
      ..writeByte(4)
      ..write(obj.curso)
      ..writeByte(5)
      ..write(obj.fotoUrl)
      ..writeByte(6)
      ..write(obj.dataValidadeMatricula)
      ..writeByte(7)
      ..write(obj.bond)
      ..writeByte(8)
      ..write(obj.textoQrCodeCarteirinha)
      ..writeByte(9)
      ..write(obj.accessToken)
      ..writeByte(10)
      ..write(obj.bondId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
