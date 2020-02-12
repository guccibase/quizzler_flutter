import 'package:flutter/material.dart';
import 'package:quizzler/Exam.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> _score = [];

  Exam exam = new Exam();
  int _number = 0;

  _alertDialog() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Exam Completed",
      desc: "Do you want to restart the exam?",
      buttons: [
        DialogButton(
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                _score.removeRange(0, 11);
                _number = 0;
                Navigator.pop(context);
                width:
                120;
              });
            })
      ],
    ).show();
  }

  examComplete() {
    _number == exam.numberOfQuestions() - 1 ? _alertDialog() : _number++;
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                exam.getQuestion(_number),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  exam.getAnswer(_number) == true
                      ? _score.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ))
                      : _score.add(Icon(
                          Icons.mood_bad,
                          color: Colors.red,
                        ));
                  examComplete();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.

                setState(() {
                  exam.getAnswer(_number) == false
                      ? _score.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ))
                      : _score.add(Icon(
                          Icons.mood_bad,
                          color: Colors.red,
                        ));
                  examComplete();
                });
              },
            ),
          ),
        ),
        Row(
          children: _score,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
