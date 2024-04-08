import 'package:flutter/material.dart';
import '../constants.dart';

// Kelas StatelessWidget yang mendefinisikan tombol untuk beralih ke pertanyaan berikutnya
class NextButton extends StatelessWidget {
  // Konstuktor yang menerima callback untuk dijalankan saat tombol ditekan
  const NextButton({Key? key, required this.nextQuestion}) : super(key: key);

  // Callback yang akan dieksekusi saat tombol disentuh
  final VoidCallback nextQuestion;

  // Metode build untuk membangun tampilan tombol
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Memicu callback nextQuestion saat tombol disentuh
      onTap: nextQuestion,
      child: Container(
        // Mengatur lebar dan gaya tombol
        width: double.infinity, // Tombol memenuhi lebar layar
        decoration: BoxDecoration(
          color: neutral, // Warna latar belakang
          borderRadius: BorderRadius.circular(10.0), // Sudut bulat
        ),
        // Menampilkan teks 'Next Question' di tengah tombol
        child: Text(
          'Next Question',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

