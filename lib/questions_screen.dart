import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/option_button.dart';
import './data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void changeQuestion(String answer) {
    widget.onSelectAnswer(answer);

    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 24,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledOptions().map(
            (option) {
              return OptionButton(
                optionText: option.toUpperCase(),
                onTap: () {
                  changeQuestion(option);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
