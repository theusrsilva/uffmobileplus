import 'package:hive/hive.dart';

part 'auth_iduff_model.g.dart';

@HiveType(typeId: 1)
class AuthIduffModel extends HiveObject {
  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final String? refreshToken;

  @HiveField(2)
  final int accessTokenExpiration;

  @HiveField(3)
  final String? codeVerifier;

  @HiveField(4)
  final String? authorizationCode;

  @HiveField(5)
  final bool isLogged;

  @HiveField(6)
  final String iduff;

  AuthIduffModel({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpiration = 0,
    this.codeVerifier,
    this.authorizationCode,
    this.isLogged = false,
    required this.iduff,
  });

  // Converter de Map para AuthInformationModel
  factory AuthIduffModel.fromMap(Map<String, dynamic> map) {
    return AuthIduffModel(
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
      accessTokenExpiration: map['accessTokenExpiration'] ?? 0,
      codeVerifier: map['codeVerifier'],
      authorizationCode: map['authorizationCode'],
      isLogged: map['isLogged'] ?? false,
      iduff: map['iduff'],
    );
  }

  // Converter de AuthInformationModel para Map
  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'accessTokenExpiration': accessTokenExpiration,
      'codeVerifier': codeVerifier,
      'authorizationCode': authorizationCode,
      'isLogged': isLogged,
      'iduff': iduff,
    };
  }

  @override
  String toString() {
    return 'AuthIduffModel(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiration: $accessTokenExpiration, codeVerifier: $codeVerifier, authorizationCode: $authorizationCode, isLogged: $isLogged, iduff: $iduff)';
  }
}
