import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth_iduff_service.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_iduff_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_umm_controller.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_data_controller.dart';

class AuthIduffController extends GetxController {
  final AuthIduffService _authIduffService = AuthIduffService();

  late final UserUmmController _userUmmController;
  late final UserDataController _userDataController;
  late final UserIduffController _userIduffController;

  @override
  void onInit() {
    _userUmmController = Get.find<UserUmmController>();
    _userDataController = Get.find<UserDataController>();
    _userIduffController = Get.find<UserIduffController>();

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
    _userIduffController.updateIsLogged(true);

    String? iduff = await _userIduffController.getIduff();
    final userUmm = await _userUmmController.getUserData(iduff);

    await _userUmmController.saveUserUmm(userUmm);
    await _userDataController.saveUserData(userUmm);

    Get.offAllNamed(Routes.HOME);
  }

  login() {
    _authIduffService
        .authenticate(Get.context)
        .then((loggedIn) => loggedIn ? loginSuccessful() : loginFailed());
  }

  Future<bool> tryLogin() async {
    return await _authIduffService.tryLogin();
  }
  
}
