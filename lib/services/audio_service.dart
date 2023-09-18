import 'package:just_audio/just_audio.dart';

enum AudioType { complete, breakBefore10Second }

class AudioService {
  AudioService() {
    _init();
  }

  final AudioPlayer _player = AudioPlayer();

  void _init() {
    open('assets/audio/complete00.mp3');
  }

  Future<Duration?> open(String assetPath) async {
    return _player.setAsset(assetPath);
  }

  void play(AudioType type) {
    _player.stop();

    switch (type) {
      case AudioType.complete:
        open('assets/audio/complete00.mp3');
        break;
      case AudioType.breakBefore10Second:
        open('assets/audio/break.m4a');
        break;
    }

    _player.play();
  }

  // 0.0 ~ 1.0
  void setVolume(double volume) {
    _player.setVolume(volume);
  }
}
