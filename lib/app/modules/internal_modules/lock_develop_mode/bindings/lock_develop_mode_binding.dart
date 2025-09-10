import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/controller/lock_develop_mode_controller.dart';

class LockDevelopModeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LockDevelopModeController>(() => LockDevelopModeController());
  }
}
