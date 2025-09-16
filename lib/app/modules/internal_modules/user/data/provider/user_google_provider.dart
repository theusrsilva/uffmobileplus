import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_google_model.dart';

enum UserRole { user, }

class UserGoogleProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _hiveBox = 'user_google_data';
  final String _hiveKey = 'current_user';

  Future<UserGoogleModel> createUserDoc(
      String email, String name, String uid, String urlImage) async {
    UserGoogleModel user = UserGoogleModel(
      name: name,
      email: email,
      id: uid,
      urlImage: urlImage,
      createdAt: DateTime.now(),
    );

    await createUserDocInFirebase(user);
    await saveUserGoogleModel(user);

    return user;
  }

  Future<void> createUserDocInFirebase(UserGoogleModel user) async {
    DocumentReference docRef = await _firestore.collection('users').add({
      'name': user.name,
      'email': user.email,
      'urlImage': user.urlImage,
      'createdAt': user.createdAt?.toIso8601String(),
    });
    user.id = docRef.id;
  }

  Future<String> saveUserGoogleModel(UserGoogleModel user) async {
    try {
      var box = await Hive.openBox<UserGoogleModel>(_hiveBox);
      await box.put(_hiveKey, user);
      return "success";
    } catch (e) {
      return "Erro ao salvar usuário Google no Hive: $e";
    }
  }

  Future<UserGoogleModel?> getUserGoogleModel() async {
    try {
      var box = await Hive.openBox<UserGoogleModel>(_hiveBox);
      return box.get(_hiveKey);
    } catch (e) {
      throw Exception("Erro ao buscar usuário Google do Hive: $e");
    }
  }

  Future<String> deleteUserGoogleModel() async {
    try {
      var box = await Hive.openBox<UserGoogleModel>(_hiveBox);
      await box.delete(_hiveKey);
      return "success";
    } catch (e) {
      return "Erro ao deletar usuário Google do Hive: $e";
    }
  }

  Future<String> clearAllUserGoogle() async {
    try {
      var box = await Hive.openBox<UserGoogleModel>(_hiveBox);
      await box.clear();
      return "success";
    } catch (e) {
      return "Erro ao limpar usuários Google do Hive: $e";
    }
  }

  Future<bool> hasUserGoogle() async {
    try {
      var box = await Hive.openBox<UserGoogleModel>(_hiveBox);
      return box.containsKey(_hiveKey);
    } catch (e) {
      return false;
    }
  }
}
