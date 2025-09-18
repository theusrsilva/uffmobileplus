import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_iduff_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/provider/auth_iduff_provider.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/repository/auth_iduff_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth_iduff_service.dart';

class AuthIduffBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthIduffProvider>(() => AuthIduffProvider());
    Get.lazyPut<AuthIduffRepository>(() => AuthIduffRepository());
    Get.lazyPut<AuthIduffService>(() => AuthIduffService());
    Get.lazyPut<AuthIduffController>(() => AuthIduffController());
  }
}
