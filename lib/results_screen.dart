import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.switchScreen, {super.key});
  final List<String> selectedAnswers;
  final void Function() switchScreen;

  // print("dsd");
  List<Map<String, Object>> getScore() {
    final List<Map<String, Object>> myResults = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$nbr/${selectedAnswers.length}',
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        SizedBox(
          height: 500,
          width: 400,
          child: ListView.builder(
            itemCount: selectedAnswers.length,
            itemBuilder: (ctx, index) => Card(
              color:
                  getScore()[index]["user_answer"] ==
                      getScore()[index]["correct_answer"]
                  ? Colors.green
                  : Colors.red,
              child: Row(
                children: [
                  Text(
                    ((getScore()[index]["id"] as int) + 1).toString(),
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getScore()[index]["question"].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              getScore()[index]["user_answer"].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              getScore()[index]["correct_answer"].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ElevatedButton(onPressed: switchScreen, child: Text("Restart")),
      ],
    );
  }
}
