// import the material package
// Import paket material dari Flutter untuk mendapatkan akses ke widget dan fungsi UI

import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome_screen.dart';
import '../constants.dart'; // Import file constants.dart untuk mendapatkan konstanta warna dan tampilan
import '../models/question_model.dart'; // Import model pertanyaan dari file question_model.dart
import '../widgets/question_widget.dart'; // Import widget pertanyaan dari file question_widget.dart
import '../widgets/next_button.dart'; // Import tombol Next dari file next_button.dart
import '../widgets/option_card.dart'; // Import widget kartu pilihan dari file option_card.dart
import '../widgets/result_box.dart'; // Import widget kotak hasil dari file result_box.dart

// create the HomeScreen widget
// Buat widget HomeScreen yang merupakan kelas StatefulWidget karena kita akan merubah state widget ini.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // create an object for Dbconnect
  
   List<Question> _questions = [
     // List of Question objects untuk menyimpan pertanyaan dan jawaban
     Question(id: '10',
       title: 'apa nama buah berikut ini?', // Pertanyaan
       image: 'images/anggur.jpg',
       options: {'Nanas': false, 'Pisang': false, 'Anggur': true, 'Sirsak': false}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '11',
       title: 'Apa warna buah berikut ini?', // Pertanyaan
       image: 'images/apel.jpg',
       options: {'Hijau': false, 'Merah': true, 'Pink': false, 'Orange': false}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '12',
       title: 'Apa kandungan vitamin pada buah berikut ini?', // Pertanyaan
       image: 'images/jeruk.jpg',
       options: {'A': false, 'B': false, 'D': false, 'C': true}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '13',
       title: 'Pada gambar berikut bisa di buat apa?', // Pertanyaan
       image: 'images/nanas.jpg',
       options: {'Jus': true, 'Tongseng': false, 'Gorengan': false, 'Rebus': false}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '14',
       title: 'apa nama usaha kaesang yang berhubungan dengan gambar brtikut?', // Pertanyaan
       image: 'images/pisang.jpg',
       options: {'markobar': false, 'sangpisang': true, 'mable': false, 'martabak': false}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '15',
       title: 'pada gambar buah di bawah ini berbentuk seoerti?', // Pertanyaan
       image: 'images/belimbing.jpg',
       options: {'kubus': false, 'segi delapan': false, 'bintang': true, 'jajar genjang': false}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '16',
       title: 'Apa nama buah di bawah ini?', // Pertanyaan
       image: 'images/charry.jpg',
       options: {'charry': true, 'pisang': false, 'beri': false, 'nangka': false}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '17',
       title: 'apakah bau buah di bawah ini bagi yang baru tahu?', // Pertanyaan
       image: 'images/durian.jpg',
       options: {'bau parfume': false, 'aroma terapi': false, 'harum pandan': false, 'menyengat': true}, // Opsi jawaban dan status kebenarannya
     ),
     Question(id: '18',
       title: 'Banyakah kandungan air pada gambar di bawah ini?', // Pertanyaan
       image: 'images/semangka.jpg',
       options: {'sangat banyak': true, 'banyak': false, 'sedang': false, 'kurang': false}, // Opsi jawaban dan status kebenarannya
     ),
     Question(
       id: '19',
       title: 'Apakah rasa buah di bawah ini?', // Pertanyaan
       image: 'images/stroberi.jpg',
       options: {'Manis': false, 'Asam': true, 'gurih': false, 'pedas manis': false}, // Opsi jawaban dan status kebenarannya
     )
     
  ];
  

 
  // Index untuk mengakses pertanyaan saat ini
  int index = 0;
  // Variabel untuk menyimpan skor
  int score = 0;
  // Boolean untuk mengecek apakah pengguna sudah memilih jawaban
  bool isPressed = false;
  // Fungsi untuk menampilkan pertanyaan selanjutnya
  bool isAlreadySelected = false;

  void nextQuestion() {
    // Fungsi untuk menampilkan pertanyaan berikutnya atau hasil akhir jika sudah mencapai pertanyaan terakhir
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
                onRestartPressed: startOver,
                onFinishPressed: finishQuiz
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Silakan pilih salah satu jawaban'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  // Fungsi untuk mengubah warna
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  // Fungsi untuk memulai kembali permainan
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

// Fungsi untuk menampilkan dialog hasil dan informasi proyek
  void finishQuiz() {
    // Menampilkan dialog dengan pesan
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text('Kuis Selesai'),
        content: Text(
          'dikerjakan oleh:\n'
          '1. Ayyub Faraby P 22091397003\n'
          '2. Hanif Ihsan A A 22091397020\n'
          '3. Dwi Putra A 22091397025',
          textAlign: TextAlign.left, // Penyusunan teks ke kiri
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const WelcomeScreen(), // Menavigasi ke quiz screen ketika tombol ditekan
                )); // Mulai kembali kuis jika diinginkan
            },
            child: Text('Selesai'),
          ),
        ],
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
            return Scaffold(
              backgroundColor: background, // Mengatur warna latar belakang
              appBar: AppBar(
                title: const Text('Quiz Buah'), // Judul aplikasi
                backgroundColor: Colors.brown, // Warna latar belakang AppBar
                shadowColor: Colors.transparent, // Menghilangkan shadow pada AppBar
                actions: [
                  // Menampilkan skor saat ini di AppBar
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Score: $score',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    // Menampilkan widget pertanyaan
                    QuestionWidget(
                      indexAction: index,
                      question: _questions[index].title,
                      questionImage: _questions[index].image,

                      totalQuestions: _questions.length,
                    ),
                    const Divider(color: neutral), // Garis pembatas
                    const SizedBox(height: 25.0), // Spasi
                    // Menampilkan opsi jawaban
                    for (int i = 0; i < _questions[index].options.length; i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                            _questions[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: _questions[index].options.keys.toList()[i],
                          color: isPressed
                              ? _questions[index]
                                          .options
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : neutral,
                        ),
                      ),
                  ],
                ),
              ),

              // Menggunakan tombol floating action button
              floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: NextButton(nextQuestion: nextQuestion,),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
  }
}
// Import file HomeScreen.dart ke dalam main.dart
