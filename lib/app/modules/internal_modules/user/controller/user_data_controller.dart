import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_data.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_data_repository.dart';

class UserDataController extends GetxController {
  UserDataController();

  final UserDataRepository _userDataRepository = UserDataRepository();
  UserData? _userData;

  // Métodos para persistência
  Future<String> saveUserData(UserData userData) async {
    _userData = userData;
    return await _userDataRepository.saveUserData(userData);
  }

  Future<UserData?> getUserData() async {
    _userData = await _userDataRepository.getUserData();
    return _userData;
  }

  Future<String> deleteUserData() async {
    _userData = null;
    return await _userDataRepository.deleteUserData();
  }

  Future<String> clearAllUserData() async {
    _userData = null;
    return await _userDataRepository.clearAllUserData();
  }

  Future<bool> hasUserData() async {
    return await _userDataRepository.hasUserData();
  }

  // Getters e setters para todos os campos
  String? get name => _userData?.name;
  set name(String? value) { _userData?.name = value; }

  String? get nomesocial => _userData?.nomesocial;
  set nomesocial(String? value) { _userData?.nomesocial = value; }

  String? get matricula => _userData?.matricula;
  set matricula(String? value) { _userData?.matricula = value; }

  String? get iduff => _userData?.iduff;
  set iduff(String? value) { _userData?.iduff = value; }

  String? get curso => _userData?.curso;
  set curso(String? value) { _userData?.curso = value; }

  String? get fotoUrl => _userData?.fotoUrl;
  set fotoUrl(String? value) { _userData?.fotoUrl = value; }

  String? get dataValidadeMatricula => _userData?.dataValidadeMatricula;
  set dataValidadeMatricula(String? value) { _userData?.dataValidadeMatricula = value; }

  String? get bond => _userData?.bond;
  set bond(String? value) { _userData?.bond = value; }

  String? get textoQrCodeCarteirinha => _userData?.textoQrCodeCarteirinha;
  set textoQrCodeCarteirinha(String? value) { _userData?.textoQrCodeCarteirinha = value; }

  String? get accessToken => _userData?.accessToken;
  set accessToken(String? value) { _userData?.accessToken = value; }
}
