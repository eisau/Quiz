import 'package:flutter/material.dart';
import 'package:Quiz/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\s your fav animal?',
      'answers': [
        {'text': 'Serpent', 'score': 10},
        {'text': 'Elephent', 'score': 7},
        {'text': 'Lion', 'score': 1},
        {'text': 'Perigrine Falcon', 'score': 4}
      ],
    },
    {
      'questionText': 'What\s your fav fantasy creature?',
      'answers': [
        {'text': 'Aslan the Lion', 'score': 1},
        {'text': 'Jewel the Unicorn', 'score': 7},
        {'text': 'Rootwit the Centaur', 'score': 5},
        {'text': 'Caspain a Telmarine', 'score': 4}
      ],
    },
    {
      'questionText': 'What\s your fav food?',
      'answers': [
        {'text': 'Burger', 'score': 1},
        {'text': 'Snake', 'score': 13},
        {'text': 'Sushi', 'score': 3},
      ],
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
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Colors.grey,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion:
                    _answerQuestion, // TODO: DO this video 52 full finish again
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
