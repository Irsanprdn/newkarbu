import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFA4E300), // Warna hijau terang
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                          child: Text('Profil',
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1.5, 1.5),
                                    // Posisi bayangan
                                    blurRadius: 3,
                                    // Intensitas blur pada bayangan
                                    color: Colors.black.withOpacity(
                                        0.7), // Warna bayangan sedikit transparan
                                  ),
                                ],)),
                      )
                  ),
                ),
                // Bagian Body
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 1.5,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFA4E300), // Hijau terang
                          Color(0xFF6FB000), // Hijau lebih gelap
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gambar Profil
                              Container(
                                width: 100,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, width: 2),
                                ),
                                child: Image.asset(
                                  'assets/images/profil.jpg', // Ganti dengan path gambar Anda
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16), // Jarak antara gambar dan teks

                              // Informasi Profil
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TAUFIK RAMADHAN',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '21013114',
                                    style: TextStyle(
                                      fontSize: 16,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'REKAYASA SISTEM TRANSPORTASI JALAN',
                                    style: TextStyle(
                                      fontSize: 16,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'POLITEKNIK KESELAMATAN TRANSPORTASI JALAN',
                                    style: TextStyle(
                                      fontSize: 16,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Jarak antara informasi profil dan tujuan

                          // Tujuan
                          Text(
                            'TUJUAN',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tujuan di buat game edukasi pemahaman rambu lalu lintas dengan nama KARBU (kartu rambu) ini '
                                'untuk membantu siswa mengenali dan memahami berbagai rambu lalu lintas dengan cara yang '
                                'interaktif dan menyenangkan. Dengan memahami rambu lalu lintas, siswa akan lebih sadar akan '
                                'pentingnya keselamatan di jalan, baik sebagai pejalan kaki maupun pengendara kendaraan bermotor.\n\n'
                                'Game edukasi menawarkan metode belajar yang lebih interaktif dibandingkan metode konvensional, '
                                'sehingga dapat meningkatkan minat dan perhatian siswa dalam mempelajari materi. Melalui '
                                'skenario-skenario dalam game, siswa dapat belajar tentang perilaku yang benar dan bertanggung '
                                'jawab di jalan, sehingga dapat membentuk kebiasaan positif sejak dini. Penggunaan game edukasi ini '
                                'juga bertujuan untuk mengetahui apakah media ini efektif dalam meningkatkan pemahaman siswa '
                                'terhadap aturan lalu lintas dibandingkan dengan metode belajar tradisional.',
                            style: TextStyle(
                              fontSize: 14,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
          // Kontainer pertama diatur dengan Positioned
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 125,
            right: MediaQuery.of(context).size.width / 2 - 350,
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
