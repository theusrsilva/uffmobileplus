import 'package:get/get.dart';
import 'package:radio_player/radio_player.dart';

// Classes que extendem GetxController são capazes
// de inicializar dados, bem como removê-los quando 
// estes não são mais necessários.
class RadioController extends GetxController {
  RadioController();

  // isPlaying é uma variável observável que
  // será eventualmente inicializada com valor inicial true.
  final isPlaying = true.obs;

  void toogleState() {
    isPlaying.toggle();
  }
}