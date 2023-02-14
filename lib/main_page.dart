import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer.dart';
import 'package:quiz_app/widgets/question.dart';
import 'package:quiz_app/widgets/result.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _quiz = [
    {
      'question': "q1",
      'answers': [
        {'text': 'a', 'score': 10},
        {"text": 'b', 'score': 0},
        {"text": 'c', 'score': 0},
        {"text": 'd', 'score': 0}
      ]
    },
    {
      'question': "q2",
      'answers': [
        {'text': 'a', 'score': 10},
        {"text": 'b', 'score': 0},
        {"text": 'c', 'score': 0},
        {"text": 'd', 'score': 0}
      ]
    },
    {
      'question': "q3",
      'answers': [
        {'text': 'a', 'score': 10},
        {"text": 'b', 'score': 0},
        {"text": 'c', 'score': 0},
        {"text": 'd', 'score': 0}
      ]
    },
  ];

  var _questIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questIndex += 1;
    });
  }

  void resetQuiz() {
    _totalScore = 0;
    setState(() {
      _questIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Center(
        child: (_questIndex < _quiz.length)
            ? Column(
                children: [
                  Question(
                    data: _quiz[_questIndex]['question'],
                  ),
                  ...(_quiz[_questIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(
                      buttonHandler: () => _answerQuestion(answer['score']),
                      dataInput: answer['text'],
                    );
                  }).toList(),
                  // Text('$_totalScore')
                ],
              )
            : Result(inputScore: _totalScore),
      ),
    );
  }
}
