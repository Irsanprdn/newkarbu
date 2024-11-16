import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static bool isPlaying = false;

  /// Fungsi untuk memutar audio
  static Future<void> playAudio(String audioPath, {bool isLocal = true}) async {
    try {
      await _audioPlayer.setSource(isLocal ? AssetSource(audioPath) : UrlSource(audioPath));
      await _audioPlayer.resume();
      isPlaying = true;
      print('play $isPlaying');
    } catch (e) {
      print("Error saat memutar audio: $e");
    }
  }

  /// Fungsi untuk menjeda audio
  static Future<void> pauseAudio() async {
    try {
      await _audioPlayer.pause();
      isPlaying = false;
      print('pause $isPlaying');
    } catch (e) {
      print("Error saat menjeda audio: $e");
    }
  }

  /// Fungsi untuk menghentikan audio
  static Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();
      isPlaying = false;
    } catch (e) {
      print("Error saat menghentikan audio: $e");
    }
  }

  /// Fungsi untuk membersihkan audio saat tidak digunakan
  static void dispose() {
    _audioPlayer.dispose();
  }

  static Future<void> toggleAudio(String audioPath, {bool isLocal = true}) async {
    if (isPlaying) {
      // Jika audio sedang diputar, pause
      await pauseAudio();
    } else {
      // Jika audio sedang dijeda atau tidak diputar, play
      await playAudio(audioPath, isLocal: isLocal);
    }
  }
}
