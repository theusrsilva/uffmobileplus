import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_iduff_controller.dart';

class UserIduffBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserIduffController>(() => UserIduffController());
  }
}
