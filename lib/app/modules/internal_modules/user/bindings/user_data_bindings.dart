import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_data_controller.dart';

class UserDataBindings implements Bindings {
@override
void dependencies() {
   Get.lazyPut<UserDataController>(() => UserDataController());
  }
}