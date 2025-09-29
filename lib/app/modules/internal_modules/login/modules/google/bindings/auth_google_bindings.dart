import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/google/controller/auth_google_controller.dart';

class AuthGoogleBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthGoogleController>(() => AuthGoogleController());
  }
}
