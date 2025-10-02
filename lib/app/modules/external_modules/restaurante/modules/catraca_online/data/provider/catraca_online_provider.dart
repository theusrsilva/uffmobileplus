import 'dart:convert';

import 'package:uffmobileplus/app/config/secrets.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/model/area.dart';
import 'package:http/http.dart' as http;
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/model/operator_transaction.dart';

class CatracaOnlineProvider {
  Future<List<AreaModel>> getAreas(String iduff, String token) async {
    var uri = Uri.https(
      Secrets.areasValidationHost,
      Secrets.areasValidationPath,
      {"iduff_operador": iduff, "token": token},
    );

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final areasJson = responseMap["content"]["areas"] as List;
      return areasJson.map((json) => AreaModel.fromJson(json)).toList();
    }

    throw Exception();
  }

  Future<List<OperatorTransactionModel>> getOperatorTransactions(
    String iduff,
    String token,
    String areaId,
  ) async {
    var uri = Uri.https(
      Secrets.transactionsValidationHost,
      Secrets.transactionsValidationPath,
      {
        "iduff_operador": iduff,
        "token": token,
        "area_id": areaId.toString(),
        "minutos": "144000", // Últimas 24 horas = 1440
      },
    );

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final transactionsJson =
          responseMap["content"]["mensagem"]["transacoes"] as List;
      return transactionsJson
          .map((json) => OperatorTransactionModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to get Operator Transactions');
    }
  }

  Future<Map<String, dynamic>> validatePayment(
    String paymentCode,
    String iduff,
    String token,
    String areaId,
  ) async {
    String idUffUser = "";
    String hash = "";
    if (paymentCode != null) {
      const startIdUff = "ididentificacao_iduff=";
      const endIdUff = "&";

      final startIndexIdUff = paymentCode.indexOf(startIdUff);
      final endIndexIdUff = paymentCode.indexOf(
        endIdUff,
        startIndexIdUff + startIdUff.length,
      );
      idUffUser = paymentCode.substring(
        startIndexIdUff + startIdUff.length,
        endIndexIdUff,
      );

      final startHash = "hash=";
      final startIndexHash = paymentCode.indexOf(startHash);
      hash = paymentCode.substring(startIndexHash + startHash.length);
    }

    var uri = Uri.https(
      Secrets.validarIntencaoPagamentoHost,
      Secrets.validarIntencaoPagamentoPath,
      {
        "iduff_operador": iduff,
        "ididentificacao_iduff": idUffUser,
        "area_debito_operador_id": areaId,
        "hash": hash,
        "token": token,
      },
    );
    http.Response response = await http.post(uri);

    Map responseMap = json.decode(response.body);

    if (responseMap["status"] == "0") {
      return {
        "valid": true,
        "message": responseMap["content"]["valor_debitado"],
        "name": responseMap["content"]["nome"],
      };
    } else {
      if (responseMap["content"]["nome"] != null) {
        return {
          "valid": false,
          "message": responseMap["content"]["descricao"],
          "name": responseMap["content"]["nome"],
        };
      } else {
        return {"valid": false, "message": responseMap["content"]["descricao"]};
      }
    }
  }
}
