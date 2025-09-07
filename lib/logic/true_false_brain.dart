import 'package:session19/logic/question.dart';

class TrueFalseBrain {
  int questionNumber = 0;
  List<Question> questionBank = [
    Question("Every thing fluuter is widget", true),
    Question("Cats can fly.", false),
  ];

  int getNumberOfQuestion() {
    return questionBank.length;
  }

  String getQustionText() {
    return questionBank[questionNumber].questionText;
  }

  bool getQustionAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }

  bool isFinished() => questionNumber == questionBank.length - 1;
  void reset() => questionNumber = 0;

  void nextQuestion() {
    ++questionNumber;
  }

  bool checkAnswer(bool userAnswer) {
    return getQustionAnswer() == userAnswer;
  }
}
