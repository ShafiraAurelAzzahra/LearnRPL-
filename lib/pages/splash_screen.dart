import 'package:flutter/material.dart';
import 'sign_in_screen.dart';  // Import halaman Sign In

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF093791),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',  // Menggunakan path logo
              height: 100,  // Sesuaikan ukuran gambar
            ),
            const SizedBox(height: 20),
            const Text(
              'LearnRPL',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    // Pindah ke Sign In Screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  },
  child: const Text(
    "Get Started",
    style: TextStyle(
      color: Color(0xFF093791),        // Mengubah warna teks jadi biru
      fontWeight: FontWeight.bold, // Membuat teks menjadi bold
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}

