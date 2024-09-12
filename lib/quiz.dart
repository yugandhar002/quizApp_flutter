import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/result_screen.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:quiz_application/question_screen.dart';
// import 'package:quiz_application/start_screen.dart';
// import 'package:quiz_application/data/questions.dart';
// import 'package:quiz_application/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedOptions = [];
  var activeScreen = 'start-screen';
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseOption(String option) {
    selectedOptions.add(option);

    if (selectedOptions.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedOptions = [];
      activeScreen = 'question-screen';
    });
  }

  void stopQuiz() {
    setState(() {
      selectedOptions = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "question-screen") {
      screenWidget = QuestionsScreen(chooseOption);
    }
    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(stopQuiz, restartQuiz, selectedOptions);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 60, 3, 173),
                Color.fromARGB(255, 152, 6, 133)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
