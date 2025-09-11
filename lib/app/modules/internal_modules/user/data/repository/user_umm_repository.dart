import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_umm_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/provider/user_umm_provider.dart';

class UserUmmRepository {
  final UserDataApi _userDataApi = UserDataApi();

  Future<UserUmmModel> getUserData(String? idUFF) async {
    return await _userDataApi.getUserData(idUFF);
  }
}