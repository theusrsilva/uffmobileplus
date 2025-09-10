import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/provider/auth_information_provider.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/repository/auth_information_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/services/auth.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/services/auth_information_service.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/bindings/user_bindings.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    UserBindings().dependencies();

    Get.lazyPut<AuthInformationProvider>(() => AuthInformationProvider());
    Get.lazyPut<AuthInformationRepository>(() => AuthInformationRepository());
    Get.lazyPut<Auth>(() => Auth());
    Get.lazyPut<AuthInformationService>(() => AuthInformationService());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
