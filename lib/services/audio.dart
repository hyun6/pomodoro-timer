import 'package:just_audio/just_audio.dart';

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

  void play() {
    _player.play();
  }

  void stop() {
    _player.stop();
    _init();
  }
}
