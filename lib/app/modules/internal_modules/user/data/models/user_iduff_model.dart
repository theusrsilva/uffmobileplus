import 'package:hive/hive.dart';

part 'user_iduff_model.g.dart';

@HiveType(typeId: 0)
class UserIduffModel extends HiveObject {
  @HiveField(0)
  String? iduff;

  @HiveField(1)
  String? fullName;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? photoUrl;

  @HiveField(4)
  String? registration;

  @HiveField(5)
  String? vinculacao;

  @HiveField(6)
  AuthIduffModel? authData;

  UserIduffModel({
    this.iduff,
    this.fullName,
    this.email,
    this.photoUrl,
    this.registration,
    this.vinculacao,
    this.authData,
  });

  factory UserIduffModel.fromJson(Map<String, dynamic> json) {
    return UserIduffModel(
      iduff: json['iduff'],
      fullName: json['fullName'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      registration: json['registration'],
      vinculacao: json['vinculacao'],
      authData: json['authData'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iduff': iduff,
      'fullName': fullName,
      'email': email,
      'photoUrl': photoUrl,
      'registration': registration,
      'vinculacao': vinculacao,
      'authData': authData?.toMap(),
    };
  }

  @override
  String toString() {
    return 'UserIduffModel(iduff: $iduff, fullName: $fullName, email: $email, photoUrl: $photoUrl, registration: $registration, vinculacao: $vinculacao, authData: $authData)';
  }
}

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

  AuthIduffModel({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpiration = 0,
    this.codeVerifier,
    this.authorizationCode,
    this.isLogged = false,
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
    };
  }

  @override
  String toString() {
    return 'AuthIduffModel(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiration: $accessTokenExpiration, codeVerifier: $codeVerifier, authorizationCode: $authorizationCode, isLogged: $isLogged)';
  }
}

