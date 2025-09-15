import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/controller/login_controller.dart';
class LoginBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<LoginController>(() => LoginController());
  }
}
