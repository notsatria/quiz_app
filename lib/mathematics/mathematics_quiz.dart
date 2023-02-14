import 'package:flutter/material.dart';
import '../widgets/answer.dart';
import '../widgets/question.dart';
import '../widgets/result.dart';

class MathematicsQuiz extends StatefulWidget {
  const MathematicsQuiz({
    Key key,
  }) : super(key: key);

  @override
  State<MathematicsQuiz> createState() => _MathematicsQuizState();
}

class _MathematicsQuizState extends State<MathematicsQuiz> {
  var _quiz = [
    {
      'id': 1,
      'question': "Berapa akar dari 0.0081? ",
      'answers': [
        {'text': 'A. 0.09', 'score': 10},
        {"text": 'B. 0.9', 'score': 0},
        {"text": 'C. 0.91', 'score': 0},
        {"text": 'D. 0.009', 'score': 0}
      ]
    },
    {
      'id': 2,
      'question': "10^-2 bisa disebut sebagai ... ",
      'answers': [
        {'text': 'A. Mili', 'score': 0},
        {"text": 'B. Centi', 'score': 10},
        {"text": 'C. Deci', 'score': 0},
        {"text": 'D. Micro', 'score': 0}
      ]
    },
    {
      'id': 3,
      'question': "Berapa hasil penjumlahan dari 5x^3 - 3x^2 - 1 dan 3x^2 + 1",
      'answers': [
        {'text': 'A. 5x^3', 'score': 10},
        {"text": 'B. 6x^2', 'score': 0},
        {"text": 'C. 5x', 'score': 0},
        {"text": 'D. 3x^2', 'score': 0}
      ]
    },
    {
      'id': 4,
      'question': "Berapa hasil dari 1^0",
      'answers': [
        {'text': 'A. -1', 'score': 0},
        {"text": 'B. 0', 'score': 0},
        {"text": 'C. 1', 'score': 10},
        {"text": 'D. Semua salah', 'score': 0}
      ]
    },
    {
      'id': 5,
      'question': "Berapa hasil pembagian 4505 : 5?",
      'answers': [
        {'text': 'A. 901', 'score': 10},
        {"text": 'B. 910', 'score': 0},
        {"text": 'C. 190', 'score': 0},
        {"text": 'D. 109', 'score': 0}
      ]
    },
    {
      'id': 6,
      'question': "Berikut adalah angka yang habis dibagi dengan 6",
      'answers': [
        {'text': 'A. 149', 'score': 0},
        {"text": 'B. 166', 'score': 0},
        {"text": 'C. 150', 'score': 10},
        {"text": 'D. 151', 'score': 0}
      ]
    },
    {
      'id': 7,
      'question':
          "Dari bilangan berikut, bilangan mana yang menghasilkan 240 jika dirinya dijumlahkan dengan pangkat 2 dari bilangan tersebut",
      'answers': [
        {'text': 'A. 20', 'score': 0},
        {"text": 'B. 18', 'score': 0},
        {"text": 'C. 16', 'score': 0},
        {"text": 'D. 15', 'score': 10}
      ]
    },
    {
      'id': 8,
      'question': "Tentukan hasil dari 8^3 x 8^2 x 8^-5",
      'answers': [
        {'text': 'A. 1', 'score': 10},
        {"text": 'B. 0', 'score': 0},
        {"text": 'C. 8', 'score': 0},
        {"text": 'D. Salah semua', 'score': 0}
      ]
    },
    {
      'id': 9,
      'question': "Bentuk sederhana dari 1.5 : 2.5 adalah",
      'answers': [
        {'text': 'A. 6 : 10', 'score': 0},
        {"text": 'B. 15 : 25', 'score': 0},
        {"text": 'C. 0.75 : 1.25', 'score': 0},
        {"text": 'D. 3 : 5', 'score': 10}
      ]
    },
    {
      'id': 10,
      'question': "Berapa hasil perkalian 121 dan 11?",
      'answers': [
        {'text': 'A. 1331', 'score': 10},
        {"text": 'B. 1313', 'score': 0},
        {"text": 'C. 1133', 'score': 0},
        {"text": 'D. 3131', 'score': 0}
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
          ),
          Center(
            child: (_questIndex < _quiz.length)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Question ${_questIndex + 1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
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
        ],
      ),
    );
  }
}
