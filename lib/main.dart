import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'red', 'score': 1},
        {'text': 'green', 'score': 13},
        {'text': 'yellow', 'score': 7},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'cat', 'score': 10},
        {'text': 'rabbit', 'score': 1},
        {'text': 'cheetah', 'score': 13},
        {'text': 'lion', 'score': 7},
      ]
    },
    {
      'questionText': 'Who\'s your favourite person',
      'answers': [
        {'text': 'y', 'score': 10},
        {'text': 't', 'score': 1},
        {'text': 'h', 'score': 13},
        {'text': 'n', 'score': 7},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("no more questions...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My app"),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
