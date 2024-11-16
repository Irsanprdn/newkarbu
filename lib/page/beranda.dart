import 'package:flutter/material.dart';
import 'package:karbugit/page/pengguna.dart';
import 'package:karbugit/page/profil.dart';
import 'package:karbugit/page/skor.dart';
import '../widget/sound.dart';
import 'menubelajar.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameHomePage(),
    );
  }
}

class GameHomePage extends StatefulWidget {
  @override
  _GameHomePageState createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  bool isMusic = false; // Add state for music
  final String _audioPath = 'sound/button.ogg';
  void dispose() {
    // Membersihkan audio player saat widget dihapus
    AudioHelper.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                // Ganti dengan gambar latar belakang Anda
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Title
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'GAME EDUKASI',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Lalu lintas',
                  style: TextStyle(
                    fontSize: 44,
                    color: Colors.yellow[700],
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Buttons
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    AudioHelper.playAudio(_audioPath, isLocal: true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuBelajarScreen(), // Navigasi ke MenuBelajarScreen
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA4E300),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Belajar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    AudioHelper.playAudio(_audioPath, isLocal: true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA4E300),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Permainan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Top Icons
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AudioHelper.playAudio(_audioPath, isLocal: true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilScreen(), // Navigasi ke MenuBelajarScreen
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA4E300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8, // Menambahkan shadow
                        shadowColor: Colors.black, // Warna shadow
                      ),
                      child: Icon(Icons.info, color: Colors.white),
                    ),
                    Text('Profil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5), // Posisi bayangan
                          blurRadius: 3, // Intensitas blur pada bayangan
                          color: Colors.black.withOpacity(0.7), // Warna bayangan sedikit transparan
                        ),
                      ],))
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AudioHelper.playAudio(_audioPath, isLocal: true);
                        setState(() {
                          isMusic = !isMusic; // Toggle the music state
                          // print(isMusic);
                          // Play or stop the music based on the state
                          if (isMusic) {
                            AudioHelper.playAudio('sound/backsound.mp3'); // Replace with your actual audio path
                          } else {
                            AudioHelper.pauseAudio(); // This will pause the music
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA4E300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8, // Menambahkan shadow
                        shadowColor: Colors.black, // Warna shadow
                      ),
                      child: Icon(Icons.music_note, color: Colors.white),
                    ),
                    Text( isMusic ? 'Musik Off' : 'Musik On' , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5), // Posisi bayangan
                          blurRadius: 3, // Intensitas blur pada bayangan
                          color: Colors.black.withOpacity(0.7), // Warna bayangan sedikit transparan
                        ),
                      ],))
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child:Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AudioHelper.playAudio(_audioPath, isLocal: true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SkorScreen(), // Navigasi ke MenuBelajarScreen
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA4E300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8, // Menambahkan shadow
                        shadowColor: Colors.black, // Warna shadow
                      ),
                      child: Icon(Icons.emoji_events, color: Colors.white),
                    ),
                    Text('Skor', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5), // Posisi bayangan
                          blurRadius: 3, // Intensitas blur pada bayangan
                          color: Colors.black.withOpacity(0.7), // Warna bayangan sedikit transparan
                        ),
                      ],))
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AudioHelper.playAudio(_audioPath, isLocal: true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PenggunaScreen(), // Navigasi ke MenuBelajarScreen
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA4E300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8, // Menambahkan shadow
                        shadowColor: Colors.black, // Warna shadow
                      ),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    Text('Pengguna', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5), // Posisi bayangan
                          blurRadius: 3, // Intensitas blur pada bayangan
                          color: Colors.black.withOpacity(0.7), // Warna bayangan sedikit transparan
                        ),
                      ],))
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AudioHelper.playAudio(_audioPath, isLocal: true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA4E300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8, // Menambahkan shadow
                        shadowColor: Colors.black, // Warna shadow
                      ),
                      child: Icon(Icons.exit_to_app, color: Colors.white),
                    ),
                    Text('Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5), // Posisi bayangan
                          blurRadius: 3, // Intensitas blur pada bayangan
                          color: Colors.black.withOpacity(0.7), // Warna bayangan sedikit transparan
                        ),
                      ],))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
