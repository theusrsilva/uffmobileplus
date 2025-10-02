import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_data_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_data.dart';

class ExternalStudyPlanService extends GetxService {
  late UserDataController _userDataController;
  late UserData _userData;

  Future<void> initialize() async {
    _userDataController = Get.find<UserDataController>();
    _userData = (await _userDataController.getUserData())!;
  }

  String getUserMatricula() {
    return _userData.matricula ?? "-";
  }

  String getUserIdUFF() {
    return _userData.iduff ?? "-";
  }

  String getUserBond() {
    return _userData.bond ?? "";
  }
}
