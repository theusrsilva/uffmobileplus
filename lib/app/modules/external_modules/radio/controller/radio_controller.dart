import 'dart:async';

import 'package:get/get.dart';
import 'package:radio_player/radio_player.dart';

class RadioController extends GetxController {
  final Rx<PlaybackState> playbackState = PlaybackState.paused.obs;
  set playbackState(value) => playbackState.value = value;

  // TODO: metadata com caracteres especiais estão mal formados.
  final metadata = Metadata(artist: 'Unknown song', title: 'Unknown artist').obs;
  set metadata(value) => metadata.value = value;

  StreamSubscription? _playbackStateSubscription;
  StreamSubscription? _metadataSubscription;

  // Initializes the plugin and starts listening to streams.
  @override
  void onInit() {
    super.onInit();

    // Set the initial radio station.
    RadioPlayer.setStation(
      title: 'Radio Player',
      url: 'https://s37.maxcast.com.br:8450/live',
    );

    RadioPlayer.metadataStream.listen(
      (metadata) {
        this.metadata = metadata;
      }
    );

    // Listen to playback state changes.
    _playbackStateSubscription = RadioPlayer.playbackStateStream.listen(
      (playbackState) {
        this.playbackState = playbackState;
      }
    );

    // Listen to metadata changes.
    _metadataSubscription = RadioPlayer.metadataStream.listen(
     (metadata) {
       this.metadata = metadata;
     }
    );
  }

  /// Disposes of stream subscriptions.
  @override
  void dispose() {
    _playbackStateSubscription?.cancel();
    _metadataSubscription?.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    RadioPlayer.reset();
    super.onClose();
  }

  void toggleState() {
    if (playbackState.value.isPlaying) {
      playbackState.value = PlaybackState.paused;
      RadioPlayer.pause();
    } else {
      playbackState.value = PlaybackState.playing;
      RadioPlayer.play();
    }
  }

  String showMetadata() {
    String song;
    String artist;

    song = (metadata.value.title != null)
      ? "${metadata.value.title}"
      : "";
    
    artist = (metadata.value.artist != null)
      ? " - ${metadata.value.artist}"
      : "";

    return song + artist;
  }
}
