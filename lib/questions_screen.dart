import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.getUserAnswer, {super.key});
  final void Function(String answer) getUserAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var qIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.getUserAnswer(selectedAnswer);
    setState(() {
      qIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[qIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentQuestion.text,
          style: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        ...currentQuestion.shuffledAnswers().map((item) {
          return ElevatedButton(
            onPressed: () {
              answerQuestion(item);
            },
            child: Text(item),
          );
        }),
      ],
    );
  }
}
