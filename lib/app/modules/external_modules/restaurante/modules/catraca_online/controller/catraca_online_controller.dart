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
  RxBool isTransactionBusy = false.obs;
  RxBool isReadQRCodeBusy = false.obs;
  RxBool isNotFirstLoad = false.obs;
  late RxList<AreaModel> areas = <AreaModel>[].obs;
  late RxList<AreaModel> selectedArea = <AreaModel>[].obs;
  late RxList<OperatorTransactionModel> operatorTransactions =
      <OperatorTransactionModel>[].obs;
  late final String iduff;
  late String? token;
  bool isTransactionValid = false;
  bool isQrCodeValid = true;
  String transactionResultMessage = "";
  String transactionUsername = "";

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
    isTransactionBusy.value = true;
    token = await service.getAccessToken();
    operatorTransactions.value = await repository.getOperatorTransactions(
      iduff,
      token,
      selectedArea[0].id,
    );
    print(operatorTransactions.toString());
    isTransactionBusy.value = false;
  }

  void selectArea(index) {
    selectedArea.value = [areas[index]];
    fetchOperatorTransactions();
    Get.toNamed(Routes.VALIDAR_PAGAMENTO);
  }

  void readCode() {
    Get.toNamed(Routes.RESULTADO_PAGE);
  }

  void initialise() async {
    isReadQRCodeBusy.value = true;
    isNotFirstLoad.value = true;

    try {
      String? barcodeScanRes = await _scanQRCode();

      if (barcodeScanRes == null || barcodeScanRes == "-1") {
        Get.back();
      } else {
        RegExp exp = RegExp(
          "^ididentificacao_iduff=([0-9]|[A-z])*&hash=([0-9]|[a-z]){40}\$",
        );

        String? match = exp.stringMatch(barcodeScanRes);

        /* if (match == barcodeScanRes) {
          Map responseMessage = await sctmService.validatePayment(
            barcodeScanRes,
          );
          transactionResultMessage = responseMessage["message"];
          isTransactionValid = responseMessage["valid"];

          if (responseMessage["name"] != null)
            transactionUsername = responseMessage["name"];
          else
            transactionUsername = "";
          isQrCodeValid = true;
        } else {
          isQrCodeValid = false;
        }
*/
        isReadQRCodeBusy.value = false;
      }
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      Get.back();
    }
  }

  Future<String?> _scanQRCode() async {
    final result = await Get.toNamed(Routes.LEITOR_QRCODE);
    return result as String?;
  }
}
