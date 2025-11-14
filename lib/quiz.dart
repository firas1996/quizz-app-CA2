import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/questions_screen.dart';
import 'package:quizz/results_screen.dart';
import 'package:quizz/start_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var x = "start-screen";

  void switchScreen() {
    setState(() {
      x = "questions-screen";
      selectedAnswers = [];
    });
  }

  List<String> selectedAnswers = [];
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen);
    void getUserAnswer(String answer) {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length) {
        setState(() {
          x = "results-screen";
        });
      }
    }

    if (x == "questions-screen") {
      activeScreen = QuestionsScreen(getUserAnswer);
    }
    if (x == "results-screen") {
      activeScreen = ResultsScreen(selectedAnswers, switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [
                const Color.fromARGB(255, 42, 7, 79),
                const Color.fromARGB(255, 78, 26, 133),
              ],
            ),
          ),
          child: Center(child: activeScreen),
        ),
      ),
    );
  }
}
