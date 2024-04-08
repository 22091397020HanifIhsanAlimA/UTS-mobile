import 'package:flutter/material.dart';
import '../constants.dart'; 

class QuestionWidget extends StatelessWidget {
  final int indexAction;
  final String question;
  final String questionImage;
  final int totalQuestions;

  const QuestionWidget({
    Key? key,
    required this.indexAction,
    required this.question,
    required this.questionImage,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Question ${indexAction + 1}/$totalQuestions',
          style: const TextStyle(fontSize: 18.0),
          selectionColor: neutral
        ),
        const SizedBox(height: 10.0),
        Text(
          question,
          style: const TextStyle(fontSize: 22.0),
        ),
        // Add the image widget below the question
        Image.asset(
          questionImage, // Provide the path to your image asset
          width: 200, // Adjust the width as needed
          height: 200, // Adjust the height as needed
          fit: BoxFit.contain, // Adjust the fit as needed
        ),
      ],
    );
  }
}


