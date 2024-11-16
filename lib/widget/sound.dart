import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  // AudioPlayer terpisah untuk musik latar dan efek suara
  static final AudioPlayer _backgroundMusicPlayer = AudioPlayer();
  static final AudioPlayer _effectPlayer = AudioPlayer();

  // Menandakan apakah musik latar sedang diputar
  static bool isBackgroundMusicPlaying = false;

  /// Fungsi untuk memutar musik latar
  static Future<void> playBackgroundMusic(String audioPath, {bool isLocal = true}) async {
    try {
      await _backgroundMusicPlayer.setSource(isLocal ? AssetSource(audioPath) : UrlSource(audioPath));
      // await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.LOOP); // Musik latar akan di-looping
      await _backgroundMusicPlayer.resume();
      isBackgroundMusicPlaying = true;
      print('Background music is playing: $isBackgroundMusicPlaying');
    } catch (e) {
      print("Error saat memutar musik latar: $e");
    }
  }

  /// Fungsi untuk memutar efek suara
  static Future<void> playEffect(String audioPath, {bool isLocal = true}) async {
    try {
      await _effectPlayer.setSource(isLocal ? AssetSource(audioPath) : UrlSource(audioPath));
      // await _effectPlayer.setReleaseMode(ReleaseMode.STOP); // Efek suara hanya dimainkan sekali
      await _effectPlayer.resume();
      print('Playing effect sound: $audioPath');
    } catch (e) {
      print("Error saat memutar efek suara: $e");
    }
  }

  /// Fungsi untuk menjeda musik latar
  static Future<void> pauseBackgroundMusic() async {
    try {
      await _backgroundMusicPlayer.pause();
      isBackgroundMusicPlaying = false;
      print('Paused background music: $isBackgroundMusicPlaying');
    } catch (e) {
      print("Error saat menjeda musik latar: $e");
    }
  }

  /// Fungsi untuk menghentikan musik latar
  static Future<void> stopBackgroundMusic() async {
    try {
      await _backgroundMusicPlayer.stop();
      isBackgroundMusicPlaying = false;
      print('Stopped background music: $isBackgroundMusicPlaying');
    } catch (e) {
      print("Error saat menghentikan musik latar: $e");
    }
  }

  /// Fungsi untuk menghentikan semua audio
  static Future<void> stopAllAudio() async {
    try {
      await _backgroundMusicPlayer.stop();
      await _effectPlayer.stop();
      isBackgroundMusicPlaying = false;
    } catch (e) {
      print("Error saat menghentikan semua audio: $e");
    }
  }

  /// Fungsi untuk toggle antara memutar dan menjeda musik latar
  static Future<void> toggleBackgroundMusic(String audioPath, {bool isLocal = true}) async {
    if (isBackgroundMusicPlaying) {
      // Jika musik latar sedang diputar, pause
      await pauseBackgroundMusic();
    } else {
      // Jika musik latar sedang dijeda atau tidak diputar, play
      await playBackgroundMusic(audioPath, isLocal: isLocal);
    }
  }

  /// Fungsi untuk membersihkan resource audio
  static void dispose() {
    _backgroundMusicPlayer.dispose();
    _effectPlayer.dispose();
  }
}
