import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/google/controller/auth_google_controller.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

class LoginController extends GetxController {
  bool showQrCode = false;
  late final _loginGoogleController;
  /*updateShowQrCode() async {
    debugPrint("updateShowQrCode");
    showQrCode = storageService.read("card_information") != null;
    update();
  }*/

  @override
  onInit() {
    //updateShowQrCode();
    _loginGoogleController = Get.find<AuthGoogleController>();
    super.onInit();
  }

  loginIDUFF() {
    Get.offAllNamed(Routes.AUTH);
  }

  loginGoogle() {
    _loginGoogleController.loginGoogle();
  }

  goToCarteirinhaPage() {
    Get.toNamed(Routes.CARTEIRINHA_DIGITAL);
  }

  loginAnonimous() {
    //Get.offAllNamed(Routes.DASHBOARD);
  }
}
