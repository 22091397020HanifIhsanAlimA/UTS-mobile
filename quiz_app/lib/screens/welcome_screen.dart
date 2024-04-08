import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
// Import quiz screen untuk digunakan saat pengguna memilih untuk memulai quis
import 'package:quiz_app/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 110), // Spasi kosong di atas gambar
            const Image(image: AssetImage('images/buah.png')), // Menampilkan gambar logo aplikasi
            const SizedBox(height: 100), // Spasi kosong antara gambar dan tombol "Mulai Quiz"
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const HomeScreen(), // Menavigasi ke quiz screen ketika tombol ditekan
                ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 50,
                ),
                backgroundColor: Colors.brown,
              ),
              child: const Text(
                'Mulai Quiz',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2
                ),
              ),
            ),
            SizedBox(height: 100,), // Spasi kosong di bawah tombol "Mulai Quiz"
            // Informasi credite pembuat aplikasi
            Text(
              'Created by Kelompok 7',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 11
              ),
            )
          ],
        ),
      ),
    );
  }
}