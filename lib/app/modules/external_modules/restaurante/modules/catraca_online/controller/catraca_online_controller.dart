import 'package:get/get.dart';
import 'package:uffmobileplus/app/data/services/external_catraca_service.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/model/area.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/repository/catraca_online_repository.dart';

class CatracaOnlinePageController extends GetxController {
  CatracaOnlinePageController();

  late ExternalCatracaService service;
  CatracaOnlineRepository repository = CatracaOnlineRepository();

  RxBool isbusy = false.obs;
  late RxList<AreaModel> areas = <AreaModel>[].obs;
  late final String iduff;
  late String? token;

  @override
  void onInit() {
    super.onInit();
    _initAsync();
  }

  Future<void> _initAsync() async {
    service = Get.find<ExternalCatracaService>();
    await service.initialize();
    iduff = service.getUserIdUFF();
    fetchAreas();
    update();
  }

  Future<void> fetchAreas() async {
    isbusy.value = true;
    token = await service.getAccessToken();
    areas.value = await repository.getAreas(iduff, token);
    print(areas.toString());
    isbusy.value = false;
  }
}
