import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutController extends GetxController {
  AboutController();

  String versionName = "";
  String versionCode = "";
  String device = "";

  @override
  void onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = packageInfo.version;
    versionCode = packageInfo.buildNumber;
    var d = DeviceInfoPlugin();
    var info;
    if (Platform.isAndroid) {
      info = await d.androidInfo;
    } else if (Platform.isIOS) {
      info = await d.iosInfo;
    }
    device = info.model ?? "Desconhecido"; // TODO: internacionalizar
    update();
  }
}
