import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/provider/auth_information_provider.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/repository/auth_information_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_umm_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthInformationProvider>(() => AuthInformationProvider());
    Get.lazyPut<AuthInformationRepository>(() => AuthInformationRepository());
    Get.lazyPut<Auth>(() => Auth());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserAuthController>(() => UserAuthController());
    Get.lazyPut<UserUmmController>(() => UserUmmController());
  }
}
