// Mengimpor library Flutter Material untuk membuat UI
import 'package:flutter/material.dart';  
import 'package:get/get.dart';  // Mengimpor GetX untuk state management dan navigasi
import 'package:myapp/materi.dart';  // Mengimpor halaman materi untuk navigasi
import 'package:myapp/quiz.dart';  // Mengimpor halaman quiz untuk navigasi
import 'home_controller.dart';  // Mengimpor HomeController untuk kontrol logika

// Definisi kelas HomeScreen yang menggunakan GetWidget dan dikendalikan oleh HomeController
class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);  // Konstruktor HomeScreen

  @override
  Widget build(BuildContext context) {
    return SafeArea(  // Menggunakan SafeArea agar UI tidak terpotong oleh area notifikasi
      child: Scaffold(
        resizeToAvoidBottomInset: false,  // Menghindari inset bawah (misalnya keyboard)
        backgroundColor: Colors.white,  // Warna latar belakang putih
        body: Column(  // Kolom utama untuk UI
          children: [
            Padding(  // Padding untuk memberi jarak di sekitar widget
              padding: const EdgeInsets.all(16.0),  // Padding 16 pixel di semua sisi
              child: Column(  // Kolom untuk menumpuk widget secara vertikal
                crossAxisAlignment: CrossAxisAlignment.start,  // Menyelaraskan widget di kiri
                children: [
                  Row(  // Membuat baris horizontal untuk ikon dan teks
                    children: [
                      const Icon(Icons.person, size: 32, color: Color(0XFF083791)),  // Ikon user berwarna biru
                      const SizedBox(width: 8),  // Jarak horizontal 8 pixel
                      Column(  // Kolom untuk menumpuk teks
                        crossAxisAlignment: CrossAxisAlignment.start,  // Menyelaraskan teks ke kiri
                        children: const [
                          Text(  // Teks sapaan
                            'Hi Good People !',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFF083791)),  // Teks biru dan bold
                          ),
                          Text('Welcome App LearnRPL', style: TextStyle(fontSize: 16, color: Color(0XFF083791))),  // Teks kedua dengan ukuran 16
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),  // Jarak vertikal 20 pixel
                  Card(  // Kartu untuk informasi aplikasi
                    color: const Color(0XFF083791),  // Warna biru pada card
                    elevation: 5,  // Elevasi untuk efek bayangan
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),  // Padding di dalam card
                      child: Row(  // Baris untuk teks dan gambar
                        children: [
                          Expanded(  // Expanded agar teks mengambil ruang yang tersisa
                            child: Column(  // Kolom untuk teks di dalam card
                              crossAxisAlignment: CrossAxisAlignment.start,  // Menyelaraskan teks ke kiri
                              children: const [
                                Text(
                                  'Hello',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),  // Teks putih dan bold
                                ),
                                SizedBox(height: 10),  // Jarak vertikal 10 pixel
                                Text(
                                  'Aplikasi ini adalah platform pembelajaran yang menyediakan materi lengkap untuk mempelajari Rekayasa Perangkat Lunak',
                                  style: TextStyle(color: Colors.white),  // Teks putih
                                ),
                              ],
                            ),
                          ),
                          Image.asset(  // Gambar logo dalam card
                            'assets/images/img_rpl1_2.png',  // Aset gambar
                            height: 50,  // Tinggi gambar 50 pixel
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),  // Jarak vertikal 20 pixel
                  TextField(  // Kotak pencarian
                    decoration: InputDecoration(  // Dekorasi untuk input teks
                      hintText: 'Search',  // Teks placeholder "Search"
                      hintStyle: const TextStyle(color: Color(0XFF083791)),  // Teks placeholder berwarna biru
                      prefixIcon: const Icon(Icons.search, color: Color(0XFF083791)),  // Ikon pencarian biru
                      border: OutlineInputBorder(  // Batas kotak input
                        borderRadius: BorderRadius.circular(8),  // Sudut melengkung 8 pixel
                        borderSide: const BorderSide(color: Color(0XFF083791)),  // Warna batas biru
                      ),
                      focusedBorder: OutlineInputBorder(  // Batas saat fokus
                        borderRadius: BorderRadius.circular(8),  // Sudut melengkung 8 pixel
                        borderSide: const BorderSide(color: Color(0XFF083791)),  // Warna batas biru saat fokus
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),  // Jarak vertikal 20 pixel
            Expanded(  // Expanded agar scroll view mengambil sisa ruang yang ada
              child: SingleChildScrollView(  // Membuat layar bisa di-scroll
                child: Padding(  // Padding dalam scroll view
                  padding: const EdgeInsets.all(16.0),
                  child: Row(  // Baris untuk menempatkan item Materi dan Quiz secara horizontal
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Memberi jarak di antara item
                    children: [
                      Expanded(  // Expanded untuk item Materi agar menempati ruang yang tersedia
                        child: InkWell(  // InkWell untuk mendeteksi klik pada item
                          onTap: () {
                            Get.to(() => MateriPage());  // Navigasi ke halaman Materi saat diklik
                          },
                          child: buildSingleItem(  // Memanggil fungsi untuk membangun item
                            'Materi',  // Judul item Materi
                            'View Catalog Materi',  // Deskripsi item Materi
                            'assets/images/img_premium_vector.png',  // Gambar untuk item Materi
                            const Color(0XFF083791),  // Warna teks biru
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),  // Jarak horizontal 12 pixel
                      Expanded(  // Expanded untuk item Quiz agar menempati ruang yang tersedia
                        child: InkWell(  // InkWell untuk mendeteksi klik pada item Quiz
                          onTap: () {
                            Get.to(() => QuizPage());  // Navigasi ke halaman Quiz saat diklik
                          },
                          child: buildSingleItem(  // Memanggil fungsi untuk membangun item Quiz
                            'Quiz',  // Judul item Quiz
                            'View Catalog Quiz',  // Deskripsi item Quiz
                            'assets/images/img_premium_vector_114x152.png',  // Gambar untuk item Quiz
                            const Color(0XFF083791),  // Warna teks biru
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(  // BottomNavigationBar untuk navigasi di bawah layar
          currentIndex: 0,  // Menetapkan tab Home sebagai yang aktif
          onTap: (index) {  // Fungsi untuk mengatur navigasi antar halaman
            // Navigasi berdasarkan index (Home, Materi, Quiz)
          },
          selectedItemColor: const Color(0XFF083791),  // Warna biru untuk item yang dipilih
          unselectedItemColor: const Color(0XFF083791),  // Warna biru juga untuk item yang tidak dipilih
          items: const [  // Item navigasi untuk Home, Materi, dan Quiz
            BottomNavigationBarItem(
              icon: Icon(Icons.home),  // Ikon untuk Home
              label: 'Home',  // Label Home
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),  // Ikon untuk Materi
              label: 'Materi',  // Label Materi
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),  // Ikon untuk Quiz
              label: 'Quiz',  // Label Quiz
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat item (Materi/Quiz) secara dinamis
  Widget buildSingleItem(String title, String item, String imagePath, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,  // Menyelaraskan konten ke kiri
      children: [
        Text(
          title,  // Menampilkan judul item (Materi/Quiz)
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor),  // Teks dengan warna dinamis
        ),
        const SizedBox(height: 10),  // Jarak vertikal 10 pixel
        Card(  // Membuat card untuk gambar dan deskripsi item
          elevation: 3,  // Elevasi untuk bayangan card
          child: SizedBox(
            height: 150,  // Tinggi card diatur 150 pixel
            child: Column(
              children: [
                Expanded(  // Expanded untuk gambar agar memenuhi ruang card
                  child: Image.asset(
                    imagePath,  // Menampilkan gambar dari parameter imagePath
                    width: double.infinity,  // Gambar memenuhi lebar card
                    fit: BoxFit.cover,  // Gambar menyesuaikan ukuran card
                  ),
                ),
                InkWell(  // InkWell untuk mendeteksi klik pada deskripsi item
                  onTap: () {
                    // Navigasi ke halaman sesuai dengan item yang diklik (Materi/Quiz)
                    if (item == 'View Catalog Materi') {
                      Get.to(() => MateriPage());  // Navigasi ke MateriPage
                    }
                    if (item == 'View Catalog Quiz') {
                      Get.to(() => QuizPage());  // Navigasi ke QuizPage
                    }
                  },
                  child: Container(
                    color: Color(0XFF083791),  // Warna biru untuk latar belakang teks
                    width: double.infinity,  // Memenuhi lebar card
                    padding: const EdgeInsets.all(8.0),  // Padding dalam container
                    child: Text(
                      item,  // Menampilkan deskripsi item
                      textAlign: TextAlign.center,  // Teks diselaraskan di tengah
                      style: const TextStyle(
                        color: Colors.white,  // Warna teks putih
                        fontSize: 14,  // Ukuran teks disesuaikan agar pas di dalam box
                        fontWeight: FontWeight.bold,  // Teks bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
