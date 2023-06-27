class QuizQuestion {
  final String text;
  final List<String> options;

  const QuizQuestion(
    this.text,
    this.options,
  );

  List<String> getShuffledOptions() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
