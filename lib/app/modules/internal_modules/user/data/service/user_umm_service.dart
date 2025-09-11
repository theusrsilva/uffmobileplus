import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_umm_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_umm_repository.dart';

class UserUmmService {
  final UserUmmRepository _repository = UserUmmRepository();


  Future<UserUmmModel> getUserData(String? idUFF) async {
    return await _repository.getUserData(idUFF);
  }
}