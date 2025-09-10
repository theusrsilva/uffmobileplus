// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInformationModelAdapter extends TypeAdapter<AuthInformationModel> {
  @override
  final int typeId = 1;

  @override
  AuthInformationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInformationModel(
      accessToken: fields[0] as String?,
      refreshToken: fields[1] as String?,
      accessTokenExpiration: fields[2] as int,
      codeVerifier: fields[3] as String?,
      authorizationCode: fields[4] as String?,
      isLogged: fields[5] as bool,
      iduff: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthInformationModel obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.isLogged)
      ..writeByte(6)
      ..write(obj.iduff);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthInformationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
