// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_iduff_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserIduffModelAdapter extends TypeAdapter<UserIduffModel> {
  @override
  final int typeId = 0;

  @override
  UserIduffModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserIduffModel(
      iduff: fields[0] as String?,
      fullName: fields[1] as String?,
      email: fields[2] as String?,
      photoUrl: fields[3] as String?,
      registration: fields[4] as String?,
      vinculacao: fields[5] as String?,
    )..authData = fields[6] as AuthIduffModel?;
  }

  @override
  void write(BinaryWriter writer, UserIduffModel obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.vinculacao)
      ..writeByte(6)
      ..write(obj.authData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserIduffModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthIduffModelAdapter extends TypeAdapter<AuthIduffModel> {
  @override
  final int typeId = 1;

  @override
  AuthIduffModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthIduffModel(
      accessToken: fields[0] as String?,
      refreshToken: fields[1] as String?,
      accessTokenExpiration: fields[2] as int,
      codeVerifier: fields[3] as String?,
      authorizationCode: fields[4] as String?,
      isLogged: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AuthIduffModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.accessTokenExpiration)
      ..writeByte(3)
      ..write(obj.codeVerifier)
      ..writeByte(4)
      ..write(obj.authorizationCode)
      ..writeByte(5)
      ..write(obj.isLogged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthIduffModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
