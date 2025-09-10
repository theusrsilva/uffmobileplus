import 'package:hive/hive.dart';

part 'user_auth_model.g.dart';

@HiveType(typeId: 0)
class UserAuthModel extends HiveObject {
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

  UserAuthModel({
    this.iduff,
    this.fullName,
    this.email,
    this.photoUrl,
    this.registration,
    this.vinculacao,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      iduff: json['iduff'],
      fullName: json['fullName'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      registration: json['registration'],
      vinculacao: json['vinculacao'],
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
    };
  }

  @override
  String toString() {
    return 'UserAuthModel(iduff: $iduff, fullName: $fullName, email: $email, photoUrl: $photoUrl, registration: $registration, vinculacao: $vinculacao)';
  }
}
