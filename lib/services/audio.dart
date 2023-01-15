import 'package:just_audio/just_audio.dart';

class AudioService {
  AudioService() {
    open('assets/audio/complete00.mp3');
  }
  final AudioPlayer _player = AudioPlayer();

  Future<Duration?> open(String assetPath) async {
    return _player.setAsset(assetPath);
  }

  void play() {
    _player.play();
  }
}
