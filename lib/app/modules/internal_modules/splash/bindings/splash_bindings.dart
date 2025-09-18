import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/splash/controller/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
