import 'package:flutter/material.dart';
import 'package:quizapp/question_summary.dart';
import './data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': questions[i].text,
          'correct-answer': questions[i].options[0],
          'user-answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final totalNumberOfQuestions = questions.length;
    final totalCorrectQuestions = summaryData.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$totalCorrectQuestions out of $totalNumberOfQuestions are accurate!",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summary: getSummary()),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.restart_alt),
              label: const Text(
                "Restart Quiz!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
