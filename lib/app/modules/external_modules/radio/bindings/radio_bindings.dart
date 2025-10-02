import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/external_modules/radio/controller/radio_controller.dart';

class RadioBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RadioController>(() => RadioController());
  }
}