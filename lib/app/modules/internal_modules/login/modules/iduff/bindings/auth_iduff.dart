import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_iduff_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/provider/auth_iduff_provider.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/repository/auth_iduff_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth_iduff_service.dart';
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
