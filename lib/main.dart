import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "question": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 6},
        {"text": "Yellow", "score": 2},
        {"text": "Brown", "score": 8}
      ]
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {"text": "Whale", "score": 7},
        {"text": "Cat", "score": 6},
        {"text": "Dog", "score": 1},
        {"text": "Horse", "score": 5}
      ]
    },
    {
      "question": "What's your favorite type of music?",
      "answers": [
        {"text": "Experimental hiphop", "score": 9},
        {"text": "Postpunk", "score": 7},
        {"text": "EDM", "score": 1},
        {"text": "Trap", "score": 3}
      ],
    }
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first app'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
