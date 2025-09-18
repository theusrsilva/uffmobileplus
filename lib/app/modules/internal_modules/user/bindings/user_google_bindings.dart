import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/provider/user_google_provider.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_google_repository.dart';

class UserGoogleBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserGoogleProvider>(() => UserGoogleProvider());
    Get.lazyPut<UserGoogleRepository>(() => UserGoogleRepository());
  }
}
