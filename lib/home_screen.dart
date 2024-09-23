import 'package:flutter/material.dart'; // Mengimpor Material Design package untuk UI di Flutter.
import 'package:get/get.dart'; // Mengimpor GetX untuk manajemen state dan routing.
import 'home_controller.dart'; // Mengimpor HomeController untuk logika bisnis.

class HomeScreen extends GetWidget<HomeController> { // Menggunakan GetWidget untuk menghubungkan HomeController dengan UI.
  const HomeScreen({Key? key}) : super(key: key); // Konstruktor untuk HomeScreen dengan key opsional.

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Membuat area aman yang menghindari overlap dengan area sistem seperti status bar.
      child: Scaffold( // Scaffold menyediakan struktur dasar untuk halaman, termasuk AppBar, body, dan bottom navigation.
        resizeToAvoidBottomInset: false, // Menghindari penyesuaian layout ketika keyboard muncul.
        backgroundColor: Colors.white, // Mengatur warna latar belakang menjadi putih.
        body: Column( // Membuat layout vertikal menggunakan Column.
          children: [
            Padding( // Menambahkan padding di sekitar elemen-elemen di dalam Column.
              padding: const EdgeInsets.all(16.0), // Padding sebesar 16 pada semua sisi.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen-elemen di kolom secara horizontal mulai dari kiri.
                children: [
                  Row( // Membuat layout horizontal (sejajar).
                    children: [
                      const Icon(Icons.person, size: 32, color: Color(0XFF083791)), // Menampilkan ikon person dengan ukuran 32 dan warna biru.
                      const SizedBox(width: 8), // Memberikan jarak 8px antara ikon dan teks.
                      Column( // Kolom untuk menampilkan teks "Hi Good People!" dan "Welcome App LearnRPL".
                        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks dari kiri.
                        children: const [
                          Text(
                            'Hi Good People !',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFF083791)), // Teks "Hi Good People!" dengan warna biru.
                          ),
                          Text('Welcome App LearnRPL', style: TextStyle(fontSize: 16, color: Color(0XFF083791))), // Teks sambutan dengan warna biru.
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Memberikan jarak vertikal sebesar 20px.
                  Card( // Menambahkan Card untuk tampilan informasi.
                    color: const Color(0XFF083791), // Warna card biru.
                    elevation: 5, // Memberikan bayangan elevasi sebesar 5.
                    child: Padding( // Menambahkan padding di dalam Card.
                      padding: const EdgeInsets.all(16.0), // Padding sebesar 16px.
                      child: Row( // Layout horizontal untuk teks dan gambar.
                        children: [
                          Expanded( // Memperluas widget anak agar mengambil ruang sisa.
                            child: Column( // Kolom untuk teks "Hello" dan deskripsi aplikasi.
                              crossAxisAlignment: CrossAxisAlignment.start, // Teks disusun dari kiri.
                              children: const [
                                Text(
                                  'Hello',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), // Teks "Hello" dengan warna putih.
                                ),
                                SizedBox(height: 10), // Jarak vertikal sebesar 10px.
                                Text(
                                  'Aplikasi ini adalah platform pembelajaran yang menyediakan materi lengkap untuk mempelajari Rekayasa Perangkat Lunak',
                                  style: TextStyle(color: Colors.white), // Deskripsi aplikasi dengan teks putih.
                                ),
                              ],
                            ),
                          ),
                          Image.asset( // Gambar di samping teks.
                            'assets/images/img_rpl1_2.png', // Path menuju gambar lokal.
                            height: 50, // Tinggi gambar 50px.
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Jarak vertikal 20px.
                  TextField( // Menambahkan Search bar.
                    decoration: InputDecoration( 
                      hintText: 'Search', // Teks placeholder "Search".
                      hintStyle: const TextStyle(color: Color(0XFF083791)), // Warna teks placeholder biru.
                      prefixIcon: const Icon(Icons.search, color: Color(0XFF083791)), // Ikon pencarian di kiri dengan warna biru.
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(8), // Border berbentuk rounded dengan radius 8px.
                        borderSide: const BorderSide(color: Color(0XFF083791)), // Warna border biru.
                      ),
                      focusedBorder: OutlineInputBorder( // Border ketika TextField aktif.
                        borderRadius: BorderRadius.circular(8), 
                        borderSide: const BorderSide(color: Color(0XFF083791)), // Border biru saat aktif.
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Jarak vertikal sebesar 20px.
            Expanded( // Menggunakan Expanded agar bagian ini bisa scroll jika konten melebihi layar.
              child: SingleChildScrollView( // Membuat konten scrollable.
                child: Padding( // Menambahkan padding di sekitar Row.
                  padding: const EdgeInsets.all(16.0), 
                  child: Row( // Membuat dua item Materi dan Quiz berdampingan.
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antara item diatur agar bersebelahan.
                    children: [
                      Expanded(
                        child: buildSingleItem('Materi', 'Materi', 'assets/images/img_premium_vector.png', const Color(0XFF083791)), // Widget untuk item "Materi".
                      ),
                      const SizedBox(width: 12), // Jarak horizontal sebesar 12px.
                      Expanded(
                        child: buildSingleItem('Quiz', 'Quiz', 'assets/images/img_premium_vector_114x152.png', const Color(0XFF083791)), // Widget untuk item "Quiz".
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar( // Menambahkan Bottom Navigation Bar.
          currentIndex: 0, // Index aktif pada tab Home.
          onTap: (index) {
            // Handle navigasi saat tab di-tap.
          },
          selectedItemColor: const Color(0XFF083791), // Warna biru untuk item yang dipilih.
          unselectedItemColor: const Color(0XFF083791), // Warna biru untuk item yang tidak dipilih.
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Ikon untuk tab Home.
              label: 'Home', // Label untuk tab Home.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book), // Ikon untuk tab Materi.
              label: 'Materi', // Label untuk tab Materi.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz), // Ikon untuk tab Quiz.
              label: 'Quiz', // Label untuk tab Quiz.
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat item tampilan dengan gambar dan teks.
  Widget buildSingleItem(String title, String item, String imagePath, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen dari kiri.
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor), // Menampilkan judul dengan warna yang dapat diubah.
        ),
        const SizedBox(height: 10), // Jarak vertikal sebesar 10px.
        Card(
          elevation: 3, // Menambahkan elevasi bayangan pada Card.
          child: SizedBox(
            height: 150, // Mengatur tinggi Card menjadi 150px.
            child: GestureDetector( // Widget untuk mendeteksi interaksi sentuh.
              onTap: () {
                // Aksi ketika item di-tap.
              },
              child: Stack( // Menumpuk gambar dan teks pada posisi bawah.
                alignment: Alignment.bottomCenter, // Mengatur konten di bagian bawah.
                children: [
                  Column( // Kolom untuk menampilkan gambar.
                    children: [
                      Expanded(
                        child: Image.asset(
                          imagePath, // Gambar yang ditampilkan.
                          width: double.infinity, // Gambar menyesuaikan lebar.
                          fit: BoxFit.cover, // Gambar menutupi seluruh area yang tersedia.
                        ),
                      ),
                    ],
                  ),
                  Container( // Kontainer di bawah gambar untuk menampilkan teks item.
                    color: Color(0XFF083791), // Warna biru untuk latar teks.
                    width: double.infinity, // Lebar penuh untuk teks.
                    padding: const EdgeInsets.all(8.0), // Padding 8px untuk teks.
                    child: Text(
                      item,
                      textAlign: TextAlign.center, // Teks berada di tengah.
                      style: const TextStyle(
                        color: Colors.white, // Warna teks putih.
                        fontSize: 14, // Ukuran font disesuaikan.
                        fontWeight: FontWeight.bold, // Teks dengan huruf tebal.
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
