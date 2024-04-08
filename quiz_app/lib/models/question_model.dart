// disini kita akan memodelkan pertanyaan kita di sini
// membuat kelas sederhana
class Question {
  // mendefinisikan bagaimana sebuah pertanyaan akan terlihat
  // setiap pertanyaan akan memiliki sebuah Id.
  final String id;
  // setiap pertanyaan akan memiliki sebuah judul, yaitu pertanyaan itu sendiri.
  final String title;

  final String image;
  // setiap pertanyaan akan memiliki opsi.
  final Map<String, bool> options;
  // pilihan akan menjadi seperti - {'1':true, '2':false} = seperti ini

  // membuat sebuah konstruktor
  Question({
    required this.id,
    required this.title,
    required this.image,
    required this.options,
  });

   // mengiverride metode toString untuk mencetak pertanyaan di konsol
  @override
  String toString() {
    return 'Question(id: $id, title: $title,image: $image, options: $options)';
  }
}
