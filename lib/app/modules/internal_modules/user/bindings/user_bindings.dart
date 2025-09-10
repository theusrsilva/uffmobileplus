import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/provider/user_auth_provider.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_auth_repository.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/service/user_auth_service.dart';

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAuthProvider>(() => UserAuthProvider());
    Get.lazyPut<UserAuthRepository>(() => UserAuthRepository());
    Get.lazyPut<UserAuthService>(() => UserAuthService());
  }
}
