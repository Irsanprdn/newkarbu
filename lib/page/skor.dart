import 'package:flutter/material.dart';

class SkorScreen extends StatefulWidget {
  @override
  _SkorScreenState createState() => _SkorScreenState();
}

class _SkorScreenState extends State<SkorScreen> {
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
                        child: Text('Skor',
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
                            RankingTile(rank: 1, username: 'USERNAME01', coins: 35980),
                            SizedBox(height: 10),
                            RankingTile(rank: 2, username: 'USERNAME02', coins: 25760),
                            SizedBox(height: 10),
                            RankingTile(rank: 3, username: 'USERNAME03', coins: 19840),
                            SizedBox(height: 10),
                            RankingTile(rank: 4, username: 'USERNAME04', coins: 15000),
                            SizedBox(height: 10),
                            RankingTile(rank: 5, username: 'USERNAME04', coins: 15000),

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

class RankingTile extends StatelessWidget {
  final int rank;
  final String username;
  final int coins;

  RankingTile({
    required this.rank,
    required this.username,
    required this.coins,
  });

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber; // Gold for rank 1
      case 2:
        return Colors.grey; // Silver for rank 2
      case 3:
        return Colors.brown; // Bronze for rank 3
      default:
        return Colors.black; // Black for other ranks
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Nomor Peringkat
          CircleAvatar(
            backgroundColor: _getRankColor(rank),
            radius: 16,
            child: Text(
              '$rank',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),

          // Avatar Pengguna
          // CircleAvatar(
          //   backgroundColor: Colors.blueAccent,
          //   radius: 20,
          //   child: Icon(Icons.person, color: Colors.white),
          // ),
          // SizedBox(width: 10),

          // Nama Pengguna dan Koin
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Nama Pengguna
                Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                // Koin
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getRankColor(rank),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '$coins',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
