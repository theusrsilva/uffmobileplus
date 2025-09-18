import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_umm_controller.dart';

class UserUmmBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserUmmController>(() => UserUmmController());
  }
}
