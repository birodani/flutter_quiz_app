import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['question'] as String,
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            data['user_answer'] as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 187, 118, 243),
            ),
          ),
          Text(
            data['correct_answer'] as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 118, 172, 243),
            ),
          )
        ],
      ),
    );
  }
}
