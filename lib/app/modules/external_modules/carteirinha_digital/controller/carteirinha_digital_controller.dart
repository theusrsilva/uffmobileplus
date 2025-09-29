import 'dart:async';

import 'package:get/get.dart';
import 'package:uffmobileplus/app/data/services/external_carteirinha_service.dart';

class CarteirinhaDigitalController extends GetxController {
  bool isBusy = true;
  bool isExpired = false;

  Timer? expirationTimer;
  late var qrCodeData;

  late final ExternalCarteirinhaService _carteirinhaService;

  @override
  void onInit() {
    super.onInit();
    _initAsync();
  }

  Future<void> _initAsync() async {
    _carteirinhaService = Get.find<ExternalCarteirinhaService>();
    await _carteirinhaService.initialize(); // Aguarda o carregamento do service
    qrCodeData = await _carteirinhaService.getQrCodeData();
    isBusy = false;
    update();
  }

  String? getUserName() => _carteirinhaService.getUserName();
  String getUserMatricula() => _carteirinhaService.getUserMatricula();
  String getUserIdUFF() => _carteirinhaService.getUserIdUFF();
  String getUserCourse() => _carteirinhaService.getUserCourse();
  String getUserPhotoUrl() => _carteirinhaService.getUserPhotoUrl();
  String getUserValidity() => _carteirinhaService.getUserValidity();
  String getUserBond() => _carteirinhaService.getUserBond();
  Future<String> getQrCodeData() => _carteirinhaService.getQrCodeData();

  void handleTimeout() {
    isExpired = true;
    update();
  }
}