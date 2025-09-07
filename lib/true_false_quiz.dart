import 'package:flutter/material.dart';
import 'package:simple_quiz_app/logic/true_false_brain.dart';
import 'package:simple_quiz_app/multiple_quiz.dart';

class TrueFalseQuiz extends StatefulWidget {
  const TrueFalseQuiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return TrueFalseQuizState();
  }
}

class TrueFalseQuizState extends State<TrueFalseQuiz> {
  TrueFalseBrain trueFalseBrain = TrueFalseBrain();
  List<Icon> scoreKeeper = [];

  void checkUserAnswer(bool userAnswer) {
    setState(() {
      trueFalseBrain.checkAnswer(userAnswer)
          ? scoreKeeper.add(Icon(Icons.check, color: Colors.green))
          : scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    });
    if (trueFalseBrain.isFinished()) {
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          trueFalseBrain.reset();
        });
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MultipleQuiz(scoreKeeper: scoreKeeper);
              },
            ),
          );
        }
      });
    } else {
      trueFalseBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Center(child: Text(trueFalseBrain.getQustionText())),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    checkUserAnswer(true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "True",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    checkUserAnswer(false);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    "False",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: scoreKeeper),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
