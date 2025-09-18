import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/google/controller/auth_google_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/google/services/auth_google_service.dart';

class AuthGoogleBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthGoogleService>(() => AuthGoogleService());
    Get.lazyPut<AuthGoogleController>(() => AuthGoogleController());
  }
}
