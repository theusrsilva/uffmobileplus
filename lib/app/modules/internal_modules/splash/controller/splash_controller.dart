import 'package:get/get.dart';
import 'package:flutter/foundation.dart'; // Add this import for kDebugMode
import 'package:uffmobileplus/app/modules/internal_modules/splash/services/splash_service.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

class SplashController extends GetxController {
  double animatedMargin = 0.0;
  bool visibleStrip = false;

  final SplashService _splashService = Get.find<SplashService>();

  bool _isDevMode = false;
  bool _tryLogin = false;

  @override
  Future<void> onReady() async {
    visibleStrip = true;
    animatedMargin = 80.0;

    _isDevMode = await _splashService.checkDevMode();
    _tryLogin = await _splashService.tryLogin();

    if (_isDevMode && !kDebugMode) {
      Get.offAllNamed(Routes.YOU_SHALL_NOT_PASS);
    } else {
      if (_tryLogin) {
        debugPrint("Auto Login successful");
        Get.offAllNamed(Routes.HOME);
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
}
