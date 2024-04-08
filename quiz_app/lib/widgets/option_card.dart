import 'package:flutter/material.dart';
import '../constants.dart';

// Kelas StatelessWidget yang menampilkan kartu pilihan dalam format ListTile
class OptionCard extends StatelessWidget {
  // Konstuktor yang menerima teks pilihan dan warna latar belakang kartu
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);

  // Teks pilihan yang akan ditampilkan pada kartu
  final String option;

  // Warna latar belakang kartu
  final Color color;

  // Metode build untuk membangun tampilan kartu pilihan
  @override
  Widget build(BuildContext context) {
    return Card(
      // Mengatur warna latar belakang kartu sesuai properti 'color'
      color: color,
      child: ListTile(
        // Menampilkan teks pilihan dengan format ListTile
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            // Menyesuaikan warna teks berdasarkan warna latar belakang
            color: color.red != color.green ? neutral : Colors.black,
          ),
        ),
      ),
    );
  }
}

