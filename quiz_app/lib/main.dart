// Import package material
import 'package:flutter/material.dart';

// Import file yang baru dibuat
import './screens/welcome_screen.dart';

// Jalankan fungsi utama
void main() {
  // Metode yang mengeksekusi aplikasi Flutter
  runApp(
    const MyApp(), // Widget yang dibuat di bawah ini
  );
}

// **Buat widget MyApp**
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Kembalikan MaterialApp sebagai dasar aplikasi
    return const MaterialApp(
      // Sembunyikan banner debug
      debugShowCheckedModeBanner: false,
      // Atur halaman utama
      home: WelcomeScreen(), // Halaman ini akan dibuat di file terpisah
    );
  }
}
