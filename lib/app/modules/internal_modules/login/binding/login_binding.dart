import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/controller/login_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/bindings/auth_bindings.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    AuthBinding().dependencies();

    Get.lazyPut<LoginController>(() => LoginController());
  }
}
