import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.selectedAnswers, {super.key});
  final List<String> selectedAnswers;

  // print("dsd");
  var nbrRepCorrect = 0;
  List<Map<String, Object>> getScore() {
    print(selectedAnswers.length);
    final List<Map<String, Object>> myResults = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == questions[i].reponses[0]) {
        nbrRepCorrect++;
      }
      myResults.add({
        "id": i,
        "question": questions[i].text,
        "correct_answer": questions[i].reponses[0],
        "user_answer": selectedAnswers[i],
      });
    }
    return myResults;
  }

  @override
  Widget build(BuildContext context) {
    final nbr = getScore()
        .where((el) => el["correct_answer"] == el["user_answer"])
        .length;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$nbr/${selectedAnswers.length}',
            style: TextStyle(color: Colors.white, fontSize: 36),
          ),
        ],
      ),
    );
  }
}
