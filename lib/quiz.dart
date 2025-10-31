import 'package:flutter/material.dart';
import 'package:quizz/questions_screen.dart';
import 'package:quizz/start_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var x = "start-screen";

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen();
    if (x == "questions-screen") {
      activeScreen = QuestionsScreen();
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
