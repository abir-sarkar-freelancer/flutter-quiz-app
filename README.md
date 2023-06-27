# Flutter Quiz App

This is a simple Quiz App built with Flutter. It uses fundamental Flutter concepts such as Stateless and Stateful Widgets, passing functions as parameters, and lifting state up.

## Overview

The Quiz App displays a series of questions to the user with multiple-choice answers. As the user selects an answer, the app updates the score and progresses to the next question. At the end of the quiz, the user's final score is displayed.

## Project Structure

The project is organized into the following main files and folders:

- `lib/main.dart`: This is the entry point of the app. It runs the `QuizApp` widget which is a `MaterialApp`.

- `lib/screens/quiz_screen.dart`: This is where the main logic of the app resides. It's a `StatefulWidget` that manages the state of the quiz, such as the current question index and the user's score.

- `lib/widgets/question_card.dart` and `lib/widgets/option.dart`: These are `StatelessWidget`s that receive props from `QuizScreen` and render the current question and options to the user.

- `lib/models/quiz_question.dart`: This defines the `QuizQuestion` model used to structure the quiz data.

- `lib/dummy_data.dart`: This file contains the list of `QuizQuestion`s used in the app.

## Concepts Used

### Stateless and Stateful Widgets

The app uses both Stateless and Stateful Widgets. Stateless widgets are widgets that describe part of the user interface which can depend on configuration and state. In this app, `Option` and `QuestionCard` are Stateless Widgets. They render the current question and options based on the props they receive.

Stateful widgets, on the other hand, are widgets that can change over time. `QuizScreen` is a Stateful Widget that maintains the state of the current question index and the user's score.

### Passing Functions as Parameters

Functions are passed as parameters to widgets in order to handle user interactions. For example, when a user selects an option, a function is called to update the state of `QuizScreen`.

### Lifting State Up

The state of the quiz is managed by `QuizScreen`, and this state is passed down to Stateless Widgets like `QuestionCard` and `Option` as props. The child widgets simply render based on the props they receive, and any user interactions are communicated back to `QuizScreen` through callback functions. This is an example of 'lifting state up' in Flutter, and it helps to keep the code more maintainable and less prone to bugs.

## Running the App

To run the app, make sure you have Flutter and Dart installed and set up. Then, navigate to the project directory in your terminal and run `flutter run`.

## License

This project is licensed under the MIT License.
