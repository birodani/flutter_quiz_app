import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/screens/question_screen.dart';
import 'package:adv_basics/screens/result_screen.dart';
import 'package:adv_basics/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/constants/screens.constants.dart' as screens;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = screens.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = screens.questionScreen;
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = screens.startScreen;
    });
  }

  chooseAnswer(String answer) {
    
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = screens.resultScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == screens.questionScreen) {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
      selectedAnswers = [];
    }

     if (activeScreen == screens.resultScreen) {
      screenWidget = ResultScreen(choosenAnswers: selectedAnswers, onPressedRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 79, 2, 123),
              Color.fromARGB(255, 115, 36, 161)
            ], begin: Alignment.topRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
