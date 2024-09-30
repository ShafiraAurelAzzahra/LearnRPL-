import 'package:flutter/material.dart';

// Halaman MateriPage adalah StatelessWidget yang menampilkan daftar materi.
class MateriPage extends StatelessWidget {
  // List materi yang berisi 5 item (judul, gambar, dan deskripsi).
  final List<Materi> materiList = [
    Materi('Materi 1', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 1'),
    Materi('Materi 2', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 2'),
    Materi('Materi 3', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 3'),
    Materi('Materi 4', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 4'),
    Materi('Materi 5', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bagian AppBar yang menampilkan judul dan icon warna putih
      appBar: AppBar(
        title: Text(
          'Material', // Judul pada AppBar
          style: TextStyle(
            color: Colors.white, // Warna teks putih
            fontWeight: FontWeight.bold, // Teks tebal
            fontSize: 20, // Ukuran font
          ),
        ),
        backgroundColor: Color(0XFF083791), // Warna background AppBar
        iconTheme: IconThemeData(color: Colors.white), // Warna icon putih
      ),
      
      // Bagian body menampilkan GridView dengan daftar materi
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di seluruh sisi
        child: GridView.count(
          crossAxisCount: 2, // 2 kolom dalam grid
          crossAxisSpacing: 16, // Jarak horizontal antar item
          mainAxisSpacing: 16, // Jarak vertikal antar item
          children: materiList.map((materi) {
            // Memetakan setiap materi ke dalam card
            return _buildMateriCard(context, materi);
          }).toList(),
        ),
      ),
      
      // BottomNavigationBar yang memiliki 3 item navigasi
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed untuk menampilkan semua item
        backgroundColor: Color(0XFF083791), // Warna latar belakang biru tua
        selectedItemColor: Colors.white, // Warna item terpilih putih
        unselectedItemColor: Colors.white, // Warna item tidak terpilih putih
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon Home
            label: 'Home', // Label Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Ikon Buku untuk materi
            label: 'Materi', // Label Materi
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz), // Ikon Quiz
            label: 'Quiz', // Label Quiz
          ),
        ],
      ),
    );
  }

  // Widget untuk membangun setiap card materi
  Widget _buildMateriCard(BuildContext context, Materi materi) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail materi saat card di-tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMateriPage(materi: materi), // Halaman Detail
          ),
        );
      },
      child: Container(
        // BoxDecoration untuk background dan border radius
        decoration: BoxDecoration(
          color: Color(0XFF083791), // Warna background biru tua untuk card
          borderRadius: BorderRadius.circular(8), // Border radius agar sudut membulat
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2), // Warna shadow
              blurRadius: 8, // Efek blur pada shadow
              offset: Offset(0, 4), // Offset shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Isi di tengah secara horizontal
          mainAxisAlignment: MainAxisAlignment.start, // Isi dimulai dari atas
          children: [
            // Gambar pada card materi dengan border radius pada sisi atas
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), // Membulatkan sudut kiri atas
                topRight: Radius.circular(8), // Membulatkan sudut kanan atas
              ),
              child: Image.asset(
                materi.imagePath, // Gambar dari path yang diberikan
                width: double.infinity, // Lebar gambar menyesuaikan container
                height: 100, // Tinggi gambar 100 pixel
                fit: BoxFit.cover, // Gambar menutupi seluruh area
              ),
            ),
            // Padding untuk judul materi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0), // Padding di dalam card
              child: Text(
                materi.judul, // Judul materi
                style: TextStyle(
                  fontSize: 16, // Ukuran font
                  fontWeight: FontWeight.bold, // Teks tebal
                  color: const Color.fromARGB(255, 255, 255, 255), // Warna teks putih
                ),
                textAlign: TextAlign.center, // Teks berada di tengah
              ),
            ),
          ],
        ),
        constraints: BoxConstraints(
          minHeight: 100, // Tinggi minimum card
          maxHeight: 100, // Tinggi maksimum card
        ),
      ),
    );
  }
}

// Class model Materi yang menyimpan judul, gambar, dan deskripsi
class Materi {
  final String judul;
  final String imagePath;
  final String deskripsi;

  Materi(this.judul, this.imagePath, this.deskripsi);
}

// Halaman detail materi untuk menampilkan informasi lebih lanjut
class DetailMateriPage extends StatelessWidget {
  final Materi materi;

  DetailMateriPage({required this.materi}); // Constructor menerima parameter Materi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(materi.judul), // Menampilkan judul materi di AppBar
        backgroundColor: Color(0XFF083791), // Warna background AppBar biru tua
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding untuk konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Isi dimulai dari kiri
          children: [
            Image.asset(materi.imagePath), // Gambar materi
            SizedBox(height: 10), // Jarak antara gambar dan deskripsi
            Text(
              materi.deskripsi, // Deskripsi materi
              style: TextStyle(
                fontSize: 18, // Ukuran font
                fontWeight: FontWeight.bold,  // Teks tebal
                color: Colors.white,          // Warna teks putih
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0XFF083791), // Warna latar belakang biru tua
    );
  }
}
