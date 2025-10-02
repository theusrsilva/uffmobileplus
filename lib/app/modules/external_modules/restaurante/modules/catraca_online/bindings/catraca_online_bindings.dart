import 'package:get/get.dart';
import 'package:uffmobileplus/app/data/services/external_catraca_service.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/controller/catraca_online_controller.dart';

class CatracaOnlineBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ExternalCatracaService>(ExternalCatracaService(), permanent: true);

    Get.put<CatracaOnlinePageController>(
      CatracaOnlinePageController(),
      permanent: true,
    );
  }
}
