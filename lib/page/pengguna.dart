import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PenggunaScreen extends StatefulWidget {
  @override
  _PenggunaScreenState createState() => _PenggunaScreenState();
}

class _PenggunaScreenState extends State<PenggunaScreen> {
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
                        child: Text('Pengguna',
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
                            // Judul
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Pilih atau Tambahkan Nama Anda',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                // Input untuk Nama
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Nama',
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10), // Spasi antara input
                                // Input untuk Kelas
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Kelas',
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10), // Spasi antara input dan tombol
                                // Tombol Tambah
                                ElevatedButton(
                                  onPressed: () {
                                    // Tambahkan logika untuk tombol tambah
                                    print('Tombol Tambah Ditekan');
                                  },
                                  child: Text('Tambah'),
                                ),
                              ],
                            ),
                            SizedBox(height: 20), // Spasi setelah Row
                            NameClassTile(name: 'John Doe', className: 'Class A'),
                            NameClassTile(name: 'Jane Smith', className: 'Class B'),
                            NameClassTile(name: 'Alice Johnson', className: 'Class C'),
                          ],
                        ),
                      ),
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

class NameClassTile extends StatefulWidget {
  final String name;
  final String className;

  NameClassTile({
    required this.name,
    required this.className,
  });

  @override
  _NameClassTileState createState() => _NameClassTileState();
}

class _NameClassTileState extends State<NameClassTile> {
  bool _isSelected = false;

  Future<void> _saveToSharedPreferences(String name, String className) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedName', name);
    await prefs.setString('selectedClass', className);
  }

  void _handleTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
    if (_isSelected) {
      _saveToSharedPreferences(widget.name, widget.className);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: _isSelected ? Colors.green[100] : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isSelected ? Colors.green : Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Nama dan Kelas
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.className,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            // Centang
            if (_isSelected)
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}