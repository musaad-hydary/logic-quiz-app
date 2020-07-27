import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    //throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What was Logic\'s original stage name?',
      'answers': [
        {'text': 'Young Sinatra', 'score': 0},
        {'text': 'Psychological', 'score': 1},
        {'text': 'Bobbysoxer', 'score': 0},
        {'text': 'Bobby Hall', 'score': 0},
      ],
    },
    {
      'questionText': 'What was the name of Logic\'s debut album?',
      'answers': [
        {'text': 'Under Pressure', 'score': 1},
        {'text': 'No Pressure', 'score': 0},
        {'text': 'The Incredible True Story', 'score': 0},
        {'text': 'Welcome to Forever', 'score': 0},
      ],
    },
    {
      'questionText': 'How many Young Sinatra projects did Logic release?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '3', 'score': 0},
        {'text': '5', 'score': 0},
      ],
    },
    {
      'questionText': 'What does Rattpack stand for?',
      'answers': [
        {'text': 'Rap All The Time', 'score': 0},
        {'text': 'Nothing', 'score': 0},
        {'text': 'Ready And Totally Tubular', 'score': 0},
        {'text': 'Real All The Time', 'score': 1},
      ],
    },
    {
      'questionText': 'Where is Logic from?',
      'answers': [
        {'text': 'Detroit', 'score': 0},
        {'text': 'Los Angeles', 'score': 0},
        {'text': 'Maryland', 'score': 1},
        {'text': 'Atlanta', 'score': 0},
      ],
    },
    {
      'questionText': 'How old was Logic when his debut album came out?',
      'answers': [
        {'text': '24', 'score': 1},
        {'text': '20', 'score': 0},
        {'text': '18', 'score': 0},
        {'text': '26', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('How Much of a Logic Fan Are You?'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
