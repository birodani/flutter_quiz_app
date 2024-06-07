import 'package:adv_basics/widgets/summary/question_identifier.dart';
import 'package:adv_basics/widgets/summary/question_item.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrectAnswer =
                data['correct_answer'] == data['user_answer'];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIdentifier(
                    questionIndex:
                        ((data['question_index'] as int) + 1).toString(),
                    isCorrectAnswer: isCorrectAnswer
                ),
                const SizedBox(width: 20),
                QuestionItem(data: data),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
