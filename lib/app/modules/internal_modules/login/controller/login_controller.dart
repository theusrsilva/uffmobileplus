import 'package:get/get.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

class LoginController extends GetxController {
  //UserRepository userRepository = Get.find<UserRepository>();
  //StorageService storageService = Get.find<StorageService>();

  bool showQrCode = false;

  /*updateShowQrCode() async {
    debugPrint("updateShowQrCode");
    showQrCode = storageService.read("card_information") != null;
    update();
  }*/

  @override
  onInit() {
    //updateShowQrCode();
    super.onInit();
  }

  loginIDUFF() {
    
    Get.offAllNamed(Routes.AUTH);
  }

  goToCarteirinhaPage() {
    //Get.toNamed(Routes.CARTEIRINHA_DIGITAL);
  }

  loginAnonimous() {
    //Get.offAllNamed(Routes.DASHBOARD);
  }
}
