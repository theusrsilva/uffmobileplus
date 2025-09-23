import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_iduff_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_iduff_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_auth_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_umm_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_umm_controller.dart';

class ExternalCarteirinhaService extends GetxService {

  late  UserUmmController _userUmmController;
  late  UserUmmModel userUmmModel = UserUmmModel();

  late  UserAuthController _userAuthController;
  late UserAuthModel userAuthModel = UserAuthModel();

  late  AuthIduffController _authIduffController;
  late AuthIduffModel authIduffModel = AuthIduffModel();

  late final selecteEnrollment = 0; // Tem que fazer a lógica para pegar o índice correto

  bool isExpired = false;

  void handleTimeout() {
    isExpired = true;
  }


  Future<void> initialize() async {
    _userUmmController = Get.find<UserUmmController>();
    userUmmModel = (await _userUmmController.getUserUmm())!;

    _userAuthController = Get.find<UserAuthController>();
    userAuthModel = (await _userAuthController.getUserAuthModel())!;

    _authIduffController = Get.find<AuthIduffController>();
    authIduffModel = (await _authIduffController.getAuthInformation())!;
  }

  String getUserName() {
    return userUmmModel.grad?.matriculas?[0].identificacao?.nomesocial ??
        userUmmModel.grad?.matriculas?[0].identificacao?.nome ??
        "-";
  }

  String getUserMatricula() {
    return userUmmModel.grad?.matriculas?[selecteEnrollment].matricula ?? "-";
  }

  String getUserIdUFF() {
    return userUmmModel.grad?.matriculas?[selecteEnrollment].identificacao?.iduff ?? "-";
  }

  String getUserCourse() {
    return userUmmModel.grad?.matriculas?[selecteEnrollment].nomeCurso ?? "-";
  }

  String getUserPhotoUrl() {
    //return userUmmModel.grad?.matriculas?[selecteEnrollment].identificacao?.foto ?? "";
    return userAuthModel.photoUrl ?? "";
  }

  String getUserValidity() {
    //return userUmmModel.grad?.matriculas?[selecteEnrollment].validade ?? "-";
    return "-";
  }

  String getUserBond(){
    return userUmmModel.activeBond!.objects?.outerObject?[1].innerObjects?.first.vinculacao?.vinculo ?? "-";
  }

 

}