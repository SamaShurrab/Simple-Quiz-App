import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:session19/logic/multiple_question_brain.dart';
import 'package:session19/true_false_quiz.dart';

class MultipleQuiz extends StatefulWidget {
  final List<Icon> scoreKeeper;
  const MultipleQuiz({super.key, required this.scoreKeeper});

  @override
  State<StatefulWidget> createState() {
    return MultipleQuizState();
  }
}

class MultipleQuizState extends State<MultipleQuiz> {
  MultipleQuestionBrain multipleQuestionBrain = MultipleQuestionBrain();
  String? selectedOption;

  void checkUserAnswer(String userAnswer) {
    setState(() {
      multipleQuestionBrain.checkAnswer(userAnswer)
          ? widget.scoreKeeper.add(Icon(Icons.check, color: Colors.green))
          : widget.scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    });

    if (multipleQuestionBrain.isFinished()) {
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          multipleQuestionBrain.reset();
          widget.scoreKeeper.clear();
        });
        if (mounted) {
          Alert(
            style: AlertStyle(backgroundColor: Colors.white),
            context: context,
            title: "Quiz App",
            desc: "Well Done",
            type: AlertType.success,
            buttons: [
              DialogButton(
                color: Colors.black,
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TrueFalseQuiz();
                    },
                  ),
                ),
                width: 120,
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ).show();
        }
      });
    } else {
      multipleQuestionBrain.nextQuestion();
      selectedOption = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              multipleQuestionBrain.getQustionText(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: multipleQuestionBrain.getNumberQustionOptions(),
              itemBuilder: (context, index) {
                return RadioGroup(
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  child: Column(
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Radio(
                            value: multipleQuestionBrain
                                .getQustionOptions()[index],
                            activeColor: Colors.blue,
                          ),
                          Text(
                            multipleQuestionBrain.getQustionOptions()[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedOption == null || selectedOption == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Must Choose Answer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    checkUserAnswer(selectedOption!);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(children: widget.scoreKeeper),
          ],
        ),
      ),
    );
  }
}
