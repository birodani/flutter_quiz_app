import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {

  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  /*
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }*/

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen') {
      screenWidget = const QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 100, 13, 151),
                Color.fromARGB(255, 160, 88, 202)
              ],
              begin: Alignment.bottomRight
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
