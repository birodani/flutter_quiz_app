import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrectAnswer});

  final String questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCorrectAnswer
              ? const Color.fromARGB(255, 105, 220, 249)
              : const Color.fromARGB(255, 225, 105, 249)),
      alignment: Alignment.center,
      child: Text(
        questionIndex,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
