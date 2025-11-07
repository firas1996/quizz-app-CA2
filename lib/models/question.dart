class QuizQuestion {
  const QuizQuestion(this.text, this.reponses);
  final String text;
  final List<String> reponses;

  List<String> shuffledAnswers() {
    final newList = List.of(reponses);
    newList.shuffle();
    return newList;
  }
}
