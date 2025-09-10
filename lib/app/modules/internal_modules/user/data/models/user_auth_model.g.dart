// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAuthModelAdapter extends TypeAdapter<UserAuthModel> {
  @override
  final int typeId = 0;

  @override
  UserAuthModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAuthModel(
      iduff: fields[0] as String?,
      fullName: fields[1] as String?,
      email: fields[2] as String?,
      photoUrl: fields[3] as String?,
      registration: fields[4] as String?,
      vinculacao: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserAuthModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.iduff)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.photoUrl)
      ..writeByte(4)
      ..write(obj.registration)
      ..writeByte(5)
      ..write(obj.vinculacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAuthModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
