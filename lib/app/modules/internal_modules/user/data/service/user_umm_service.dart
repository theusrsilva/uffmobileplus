import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_umm_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/repository/user_umm_repository.dart';

class UserUmmService {
  final UserUmmRepository _repository = UserUmmRepository();

  Future<String> saveUserUmm(UserUmmModel userUmm) async {
    return await _repository.saveUserUmmModel(userUmm);
  }

  Future<UserUmmModel?> getUserUmm() async {
    return await _repository.getUserUmmModel();
  }

  Future<String> deleteUserUmm() async {
    return await _repository.deleteUserUmmModel();
  }

  Future<String> clearAllUserUmm() async {
    return await _repository.clearAllUserUmm();
  }

  Future<bool> hasUserUmm() async {
    return await _repository.hasUserUmm();
  }
}