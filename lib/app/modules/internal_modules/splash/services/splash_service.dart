import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/controller/lock_develop_mode_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/services/auth_information_service.dart';

class SplashService extends GetxService {
  final LockDevelopModeController _lockController =
      Get.find<LockDevelopModeController>();

  final AuthInformationService _authInformationService =
      Get.find<AuthInformationService>();

  Future<bool> checkDevMode() async {
    return await _lockController.updateDevMode();
  }

  Future<bool> tryLogin() async {
    return await _authInformationService.tryLogin();
  }
}
