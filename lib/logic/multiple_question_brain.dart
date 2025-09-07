import 'package:simple_quiz_app/logic/multiple_qusetion.dart';

class MultipleQuestionBrain {
  int questionNumber = 0;
  List<MultipleQusetion> questionBank = [
    MultipleQusetion(
      "Which widget is used to create a scrollable list in Flutter?",
      "ListView",
      ["Container", "ListView", "Column", "Row"],
    ),
    MultipleQusetion(
      "Which keyword is used to create a constant variable in Dart?",
      "const",
      ["final", "let", "const", "var"],
    ),
  ];

  int getNumberOfQuestion() {
    return questionBank.length;
  }

  String getQustionText() {
    return questionBank[questionNumber].questionText;
  }

  String getQustionAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }

  List<String> getQustionOptions() {
    return questionBank[questionNumber].questionOptions;
  }

  bool isFinished() => questionNumber == questionBank.length - 1;
  void reset() => questionNumber = 0;

  void nextQuestion() {
    ++questionNumber;
  }

  bool checkAnswer(String userAnswer) {
    return getQustionAnswer() == userAnswer;
  }

  int getNumberQustionOptions() {
    return getQustionOptions().length;
  }
}
