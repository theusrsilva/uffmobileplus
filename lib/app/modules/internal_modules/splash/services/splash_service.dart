import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/controller/lock_develop_mode_controller.dart';

class SplashService extends GetxService {
  final LockDevelopModeController _lockController =
      Get.find<LockDevelopModeController>();

  Future<bool> checkDevMode() async {
    return await _lockController.updateDevMode();
  }
}
