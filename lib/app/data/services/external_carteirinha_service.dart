import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_iduff_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_iduff_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth_iduff_service.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_auth_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_data.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_umm_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_umm_controller.dart';
import 'package:uffmobileplus/app/config/secrets.dart';

class ExternalCarteirinhaService extends GetxService {
  late UserDataController _userDataController;
  late UserData userData = UserData();

  final AuthIduffService _auth = AuthIduffService();

  late final selecteEnrollment =
      0; // Tem que fazer a lógica para pegar o índice correto

  bool isExpired = false;

  void handleTimeout() {
    isExpired = true;
  }

  Future<void> initialize() async {
    _userDataController = Get.find<UserDataController>();
    userData = (await _userDataController.getUserData())!;

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
    return userUmmModel
            .grad
            ?.matriculas?[selecteEnrollment]
            .identificacao
            ?.iduff ??
        "-";
  }

  String getUserCourse() {
    return userUmmModel.grad?.matriculas?[selecteEnrollment].nomeCurso ?? "-";
  }

  String getUserPhotoUrl() {
    //return userUmmModel.grad?.matriculas?[selecteEnrollment].identificacao?.foto ?? "";
    return userIduffModel.photoUrl ?? "";
  }

  String getUserValidity() {
    //return userUmmModel.grad?.matriculas?[selecteEnrollment].validade ?? "-";
    return "-";
  }

  String getUserBond() {
    return userUmmModel
            .activeBond!
            .objects
            ?.outerObject?[1]
            .innerObjects
            ?.first
            .vinculacao
            ?.vinculo ??
        "-";
  }

  Future<String> getQrCodeData() async {
    await _auth.refreshToken();

    String? token = await _authIduffController.getAccessToken();
    String iduffUsuario = getUserIdUFF();

    var uri = Uri.https(
      Secrets.carteirinhaValidationHost,
      Secrets.carteirinhaValidationPath,
      {
        "iduff_usuario": iduffUsuario,
        "token": token ?? "",
      },
    );
    http.Response response = await _auth.client!.post(uri);
    var responseDecoded = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseDecoded["content"] != null) {
        final data = json.decode(response.body);
        final textoQrCode = data['content']['texto_qr_code'].toString();
        final dataValidade =
            data['content']['dados_usuario']['vinculacoes'][0]['data_validade'];
        return textoQrCode;
      }
    }
    return "";
  }
}
