import 'package:get/get.dart';
import 'package:uffmobileplus/app/data/services/external_catraca_service.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/model/area.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/model/operator_transaction.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/repository/catraca_online_repository.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

class CatracaOnlineController extends GetxController {
  CatracaOnlineController();

  late ExternalCatracaService service;
  CatracaOnlineRepository repository = CatracaOnlineRepository();

  RxBool isAreaBusy = false.obs;
  RxBool isTTransactionBusy = false.obs;
  late RxList<AreaModel> areas = <AreaModel>[].obs;
  late RxList<AreaModel> selectedArea = <AreaModel>[].obs;
  late RxList<OperatorTransactionModel> operatorTransactions =
      <OperatorTransactionModel>[].obs;
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
    isAreaBusy.value = true;
    token = await service.getAccessToken();
    areas.value = await repository.getAreas(iduff, token);
    isAreaBusy.value = false;
  }

  Future<void> fetchOperatorTransactions() async {
    isTTransactionBusy.value = true;
    token = await service.getAccessToken();
    operatorTransactions.value = await repository.getOperatorTransactions(
      iduff,
      token,
      selectedArea[0].id,
    );
    print(operatorTransactions.toString());
    isTTransactionBusy.value = false;
  }

  void selectArea(index) {
    selectedArea.value = [areas[index]];
    fetchOperatorTransactions();
    Get.toNamed(Routes.VALIDAR_PAGAMENTO);
  }
}
