import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;


  List<Map<String, Object>> getSummeryMap() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summeryData = getSummeryMap();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectQuestions = summeryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('You answered $numberOfCorrectQuestions out of $numberOfTotalQuestions questions correctly!'),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summeryData),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Restart'),
          ),
        ]),
      ),
    );
  }
}
