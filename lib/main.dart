import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const LearnRPLApp());
}

class LearnRPLApp extends StatelessWidget {
  const LearnRPLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnRPL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,  // Jika ingin menggunakan Material Design 3
      ),
      home: const SplashScreen(),
    );
  }
}
