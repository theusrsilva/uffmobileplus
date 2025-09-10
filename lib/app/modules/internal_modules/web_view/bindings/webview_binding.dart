import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/web_view/controller/webview_controller.dart';

class WebViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewPageController>(() => WebViewPageController());
  }
}
