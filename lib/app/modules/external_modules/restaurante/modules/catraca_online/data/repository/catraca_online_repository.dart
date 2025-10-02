import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/model/area.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/catraca_online/data/provider/catraca_online_provider.dart';

class CatracaOnlineRepository {
  CatracaOnlineRepository();

  CatracaOnlineProvider catracaOnlineProvider = CatracaOnlineProvider();

  Future<List<AreaModel>> getAreas(iduff, token) async {
    return await catracaOnlineProvider.getAreas(iduff, token);
  }
}
