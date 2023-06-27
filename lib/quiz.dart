import 'package:flutter/material.dart';
import 'package:quizapp/results_screen.dart';
import './data/questions.dart';
import './questions_screen.dart';
import './starting_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "starting-screen";
  List<String> selectedOptions = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedOptions = [];
      activeScreen = 'starting-screen';
    });
  }

  void chooseOption(String answer) {
    selectedOptions.add(answer);
    if (selectedOptions.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartingScreen(startQuiz: switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseOption,
      );
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedOptions,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.blue,
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
