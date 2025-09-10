import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/controller/lock_develop_mode_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/splash/controller/splash_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/splash/services/splash_service.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashService>(() => SplashService());
    //Get.lazyPut<LockDevelopModeService>(() => LockDevelopModeService());
    Get.lazyPut<LockDevelopModeController>(() => LockDevelopModeController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
