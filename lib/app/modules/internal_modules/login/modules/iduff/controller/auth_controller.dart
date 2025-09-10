import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/services/auth.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/services/auth_information_service.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthInformationService _authInformationService =
      Get.find<AuthInformationService>();
  final Auth _auth = Get.find<Auth>();

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

  loginSuccessful() {
    _authInformationService.updateIsLogged(true);
    Get.offAllNamed(Routes.HOME);
  }
}
