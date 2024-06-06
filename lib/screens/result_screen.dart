import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/widgets/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers, required this.onPressedRestart });

  final List<String> choosenAnswers;
  final Function() onPressedRestart;

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You answered $numberOfCorrectQuestions out of $numberOfTotalQuestions questions correctly!',
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 222, 197, 237),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summeryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: onPressedRestart,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: const Text(
                  'Restart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
