import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_iduff_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/repository/auth_iduff_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth_iduff_service.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_umm_controller.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_data_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_data.dart';

class AuthIduffController extends GetxController {
  late final UserUmmController _userUmmController;
  late final AuthIduffRepository _authInformationRepository;
  late final AuthIduffService _authIduffService;
  late final UserDataController _userDataController;

  @override
  void onInit() {
    _userUmmController = Get.find<UserUmmController>();
    _authInformationRepository = Get.find<AuthIduffRepository>();
    _authIduffService = Get.find<AuthIduffService>();
    _userDataController = Get.find<UserDataController>();
    super.onInit();
  }

  backToLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }

  loginFailed() {
    // backToLogin();
    Get.dialog(
      CupertinoAlertDialog(
        title: const Text("Ops..."),
        content: const Text("Login não efetuado"),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Get.offAllNamed(Routes.LOGIN),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  loginSuccessful() async {
    updateIsLogged(true);
    String? iduff = await getIduff();
    final userUmm = await _userUmmController.getUserData(iduff);
    if (userUmm != null) {
      await _userUmmController.saveUserUmm(userUmm);
      // Montar e salvar UserData
      final userData = UserData(
        name: userUmm.grad?.matriculas?[0].identificacao?.nomesocial ?? userUmm.grad?.matriculas?[0].identificacao?.nome ?? "-",
        nomesocial: userUmm.grad?.matriculas?[0].identificacao?.nomesocial ?? "-",
        matricula: userUmm.grad?.matriculas?[0].matricula ?? "-",
        iduff: userUmm.grad?.matriculas?[0].identificacao?.iduff ?? "-",
        curso: userUmm.grad?.matriculas?[0].nomeCurso ?? "-",
        fotoUrl: null, // Preencher com lógica se necessário
        dataValidadeMatricula: "-", // Preencher com lógica se necessário
        bond: userUmm.activeBond?.objects?.outerObject?[1].innerObjects?.first.vinculacao?.vinculo ?? "-",
        textoQrCodeCarteirinha: null, // Preencher depois se necessário
        accessToken: await getAccessToken(),
      );
      await _userDataController.saveUserData(userData);
    }
    Get.offAllNamed(Routes.HOME);
  }

  login() {
    _authIduffService
        .authenticate(Get.context)
        .then((loggedIn) => loggedIn ? loginSuccessful() : loginFailed());
  }

  Future<String> saveAuthInformation(AuthIduffModel authInfo) async {
    return await _authInformationRepository.saveAuthInformation(authInfo);
  }

  Future<AuthIduffModel?> getAuthInformation() async {
    return await _authInformationRepository.getAuthInformation();
  }

  Future<String> deleteAuthInformation() async {
    return await _authInformationRepository.deleteAuthInformation();
  }

  Future<String> clearAllAuthInformation() async {
    return await _authInformationRepository.clearAllAuthInformation();
  }

  Future<bool> hasAuthInformation() async {
    return await _authInformationRepository.hasAuthInformation();
  }

  Future<String> updateIsLogged(bool isLogged) async {
    return await _authInformationRepository.updateIsLogged(isLogged);
  }

  Future<bool?> getIsLogged() async {
    return await _authInformationRepository.getIsLogged();
  }

  Future<String?> getAccessToken() {
    return _authInformationRepository.getAccessToken();
  }

  Future<String?> getRefreshToken() {
    return _authInformationRepository.getRefreshToken();
  }

  Future<String?> getCodeVerifier() {
    return _authInformationRepository.getCodeVerifier();
  }

  Future<String?> getAuthorizationCode() {
    return _authInformationRepository.getAuthorizationCode();
  }

  Future<String?> getIduff() {
    return _authInformationRepository.getIduff();
  }

  Future<bool> tryLogin() async {
    return await _authIduffService.tryLogin();
  }
}
