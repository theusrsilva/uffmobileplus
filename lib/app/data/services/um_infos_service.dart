import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UmInfosService extends GetxService {
  RxString version = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadInfos();
  }

  Future<void> _loadInfos() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }
}
