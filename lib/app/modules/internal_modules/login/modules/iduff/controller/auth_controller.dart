import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/repository/auth_information_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_umm_controller.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

class AuthController extends GetxController {
  final UserUmmController _userUmmController = Get.find<UserUmmController>();
  final Auth _auth = Get.find<Auth>();
  final AuthInformationRepository _authInformationRepository =
      Get.find<AuthInformationRepository>();

  backToLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    _auth
        .authenticate(Get.context)
        .then((loggedIn) => loggedIn ? loginSuccessful() : loginFailed());
    super.onInit();
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

    final userUmm = await _userUmmController.getUserUmm();
    if (userUmm != null) {
      await _userUmmController.saveUserUmm(userUmm);
    }
    Get.offAllNamed(Routes.HOME);
  }

  Future<String> saveAuthInformation(AuthInformationModel authInfo) async {
    return await _authInformationRepository.saveAuthInformation(authInfo);
  }

  Future<AuthInformationModel?> getAuthInformation() async {
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
    return await _auth.tryLogin();
  }
}
