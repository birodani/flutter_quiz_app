import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  const AnswerButton( {super.key, required this.answerText, required this.onPressed,});

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromRGBO(74, 1, 157, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
          ),
      ), 
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        ),
    );
  }
  
}