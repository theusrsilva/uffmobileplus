import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_auth_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/provider/user_auth_provider.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_auth_repository.dart';

class UserAuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAuthProvider>(() => UserAuthProvider());
    Get.lazyPut<UserAuthRepository>(() => UserAuthRepository());
    Get.lazyPut<UserAuthController>(() => UserAuthController());
  }
}
