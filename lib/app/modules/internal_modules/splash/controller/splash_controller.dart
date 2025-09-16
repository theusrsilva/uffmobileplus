import 'package:get/get.dart';
import 'package:flutter/foundation.dart'; // Add this import for kDebugMode
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/controller/lock_develop_mode_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_iduff_controller.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LockDevelopModeController _lockController =
      Get.find<LockDevelopModeController>();

  final AuthController _authController = Get.find<AuthController>();


  double animatedMargin = 0.0;
  bool visibleStrip = false;

  bool _isDevMode = false;
  bool _login = false;

  @override
  Future<void> onReady() async {
    visibleStrip = true;
    animatedMargin = 80.0;

    _isDevMode = await _checkDevMode();
    _login = await _tryLogin();

    if (_isDevMode && !kDebugMode) {
      Get.offAllNamed(Routes.YOU_SHALL_NOT_PASS);
    } else {
      if (_login) {
        debugPrint("Auto Login successful");
        _authController.loginSuccessful();
      } else {
        debugPrint("Auto Login failed");
        Get.offAllNamed(Routes.LOGIN);
      }
    }

    update();
  }

  double findLogoSize() {
    return Get.height * 0.3;
  }

  double findIconSize() {
    double padding = 2.0;
    return ((Get.height - findLogoSize() - padding * 2 * 10) / 10);
  }

  void onEnd() {}

  Future<bool> _checkDevMode() async {
    return await _lockController.updateDevMode();
  }

  Future<bool> _tryLogin() async {
    return await _authController.tryLogin();
  }
}
