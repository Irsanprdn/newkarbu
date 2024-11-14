import 'package:flutter/material.dart';

class MenuBelajarScreen extends StatefulWidget {
  @override
  _MenuBelajarScreenState createState() => _MenuBelajarScreenState();
}

class _MenuBelajarScreenState extends State<MenuBelajarScreen> {
  bool _isPressed = false;
  bool _isPressed2 = false;
  bool _isPressed3 = false;
  bool _isPressed4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Path gambar latar belakang
              fit: BoxFit.cover, // Gambar latar belakang mengisi seluruh area
            ),
          ),
          // Konten lainnya berada di atas gambar latar belakang
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5, // 50% dari lebar layar
              height: MediaQuery.of(context).size.height * 0.8, // 80% dari tinggi layar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/tombol/Container Profile Kosong.png'), // Ganti dengan path gambar yang Anda inginkan
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Vertikal ke atas
                crossAxisAlignment: CrossAxisAlignment.center, // Horizontal ke tengah
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0), // Padding hanya di atas
                    child: Text(
                      'Menu Belajar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1.5, 1.5), // Posisi bayangan
                            blurRadius: 3, // Intensitas blur pada bayangan
                            color: Colors.black.withOpacity(0.7), // Warna bayangan sedikit transparan
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Kontainer pertama diatur dengan Positioned
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 50,
            left: MediaQuery.of(context).size.width / 2 - 310, // Menyesuaikan posisi horizontal agar kontainer di tengah
            child: GestureDetector(
              onTapDown: (_) {
                // Saat ditekan, gambar akan mengecil
                setState(() {
                  _isPressed = true;
                });
              },
              onTapUp: (_) {
                // Setelah dilepas, gambar akan kembali normal
                setState(() {
                  _isPressed = false;
                });
              },
              onTapCancel: () {
                // Jika tap dibatalkan, gambar akan kembali normal
                setState(() {
                  _isPressed = false;
                });
              },
              child: AnimatedScale(
                scale: _isPressed ? 0.9 : 1.0, // Saat ditekan, gambar mengecil
                duration: Duration(milliseconds: 100), // Durasi animasi
                child: Container(
                  width: 80, // Lebar kontainer
                  height: 80, // Tinggi kontainer
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Membuat gambar memiliki sudut yang melengkung
                    child: Image.asset(
                      'assets/tombol/Putih_Pictoicon_Arrow_Backward.png', // Ganti dengan path gambar yang sesuai
                      fit: BoxFit.cover, // Agar gambar mengisi seluruh kontainer
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Kontainer kedua diatur dengan Positioned
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 50,
            right: MediaQuery.of(context).size.width / 2 - 310,
            child: GestureDetector(
              onTapDown: (_) {
                // Saat ditekan, gambar akan mengecil
                setState(() {
                  _isPressed2 = true;
                });
              },
              onTapUp: (_) {
                // Setelah dilepas, gambar akan kembali normal
                setState(() {
                  _isPressed2 = false;
                });
              },
              onTapCancel: () {
                // Jika tap dibatalkan, gambar akan kembali normal
                setState(() {
                  _isPressed2 = false;
                });
              },
              child: AnimatedScale(
                scale: _isPressed2 ? 0.9 : 1.0, // Saat ditekan, gambar mengecil
                duration: Duration(milliseconds: 100), // Durasi animasi
                child: Container(
                  width: 80, // Lebar kontainer
                  height: 80, // Tinggi kontainer
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Membuat gambar memiliki sudut yang melengkung
                    child: Image.asset(
                      'assets/tombol/Putih_Pictoicon_Arrow_Backward_copy.png', // Ganti dengan path gambar yang sesuai
                      fit: BoxFit.cover, // Agar gambar mengisi seluruh kontainer
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height / 2 - 120,
            right: MediaQuery.of(context).size.width / 2 - 170,
            child: GestureDetector(
              onTapDown: (_) {
                // Saat ditekan, gambar akan mengecil
                setState(() {
                  _isPressed3 = true;
                });
              },
              onTapUp: (_) {
                // Setelah dilepas, gambar akan kembali normal
                setState(() {
                  _isPressed3 = false;
                });
              },
              onTapCancel: () {
                // Jika tap dibatalkan, gambar akan kembali normal
                setState(() {
                  _isPressed3 = false;
                });
              },
              child: AnimatedScale(
                scale: _isPressed3 ? 0.9 : 1.0, // Saat ditekan, gambar mengecil
                duration: Duration(milliseconds: 100), // Durasi animasi
                child: Container(
                  width: 60, // Lebar kontainer
                  height: 60, // Tinggi kontainer
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Membuat gambar memiliki sudut yang melengkung
                    child: Image.asset(
                      'assets/tombol/btn_play.png', // Ganti dengan path gambar yang sesuai
                      fit: BoxFit.cover, // Agar gambar mengisi seluruh kontainer
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 150,
            right: MediaQuery.of(context).size.width / 2 - 220,
            child: GestureDetector(
              onTapDown: (_) {
                // Saat ditekan, gambar akan mengecil
                setState(() {
                  _isPressed4 = true;
                });
              },
              onTapUp: (_) {
                // Setelah dilepas, gambar akan kembali normal
                setState(() {
                  _isPressed4 = false;
                });

                // Tambahkan Navigator.pop untuk kembali ke layar sebelumnya
                Navigator.pop(context);
              },
              onTapCancel: () {
                // Jika tap dibatalkan, gambar akan kembali normal
                setState(() {
                  _isPressed4 = false;
                });
              },
              child: AnimatedScale(
                scale: _isPressed4 ? 0.9 : 1.0, // Saat ditekan, gambar mengecil
                duration: Duration(milliseconds: 100), // Durasi animasi
                child: Container(
                  width: 50, // Lebar kontainer
                  height: 50, // Tinggi kontainer
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Membuat gambar memiliki sudut yang melengkung
                    child: Image.asset(
                      'assets/tombol/Putih_Pictoicon_Cancle.png', // Ganti dengan path gambar yang sesuai
                      fit: BoxFit.cover, // Agar gambar mengisi seluruh kontainer
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
