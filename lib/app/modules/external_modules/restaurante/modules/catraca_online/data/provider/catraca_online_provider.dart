import 'dart:convert';

import 'package:uffmobileplus/app/config/secrets.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/model/area.dart';
import 'package:http/http.dart' as http;

class CatracaOnlineProvider {
  Future<List<AreaModel>> getAreas(iduff, token) async {
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
}
