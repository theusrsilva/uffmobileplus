import 'package:get/get.dart';

class HomePageController extends GetxController {

//final HomeRepository repository;
HomePageController();//this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}