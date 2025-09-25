
import 'package:hive/hive.dart';
part 'user_data.g.dart';


@HiveType(typeId: 18)
class UserData extends HiveObject {
  
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? nomesocial;

  @HiveField(2)
  String? matricula;

  @HiveField(3)
  String? iduff;

  @HiveField(4)
  String? curso;

  @HiveField(5)
  String? fotoUrl;

  @HiveField(6)
  String? dataValidadeMatricula;

  @HiveField(7)
  String? bond;

  @HiveField(8)
  String? textoQrCodeCarteirinha;

  @HiveField(9)
  String? accessToken;


  UserData({
    this.name,
    this.nomesocial,
    this.matricula,
    this.iduff,
    this.curso,
    this.fotoUrl,
    this.dataValidadeMatricula,
    this.bond,
    this.textoQrCodeCarteirinha,
    this.accessToken,
  });


  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] as String?,
      nomesocial: json['nomesocial'] as String?,
      matricula: json['matricula'] as String?,
      iduff: json['iduff'] as String?,
      curso: json['curso'] as String?,
      fotoUrl: json['fotoUrl'] as String?,
      dataValidadeMatricula: json['dataValidadeMatricula'] as String?,
      bond: json['bond'] as String?,
      textoQrCodeCarteirinha: json['textoQrCodeCarteirinha'] as String?,
      accessToken: json['accessToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nomesocial': nomesocial,
      'matricula': matricula,
      'iduff': iduff,
      'curso': curso,
      'fotoUrl': fotoUrl,
      'dataValidadeMatricula': dataValidadeMatricula,
      'bond': bond,
      'textoQrCodeCarteirinha': textoQrCodeCarteirinha,
      'accessToken': accessToken,
    };
  }
}