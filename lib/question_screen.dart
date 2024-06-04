import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuiestionIndex = 0;

  void answerQuestion() {
    setState(() {
       currentQuiestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuiestion = questions[currentQuiestionIndex];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuiestion.text),
            const SizedBox(height: 30),
            ...currentQuiestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, answerQuestion);
            })
          ],
        ),
      ),
    );
  }
}
