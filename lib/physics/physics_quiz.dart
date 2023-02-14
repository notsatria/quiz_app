import 'package:flutter/material.dart';
import '../widgets/answer.dart';
import '../widgets/question.dart';
import '../widgets/result.dart';

class PhysicsQuiz extends StatefulWidget {
  const PhysicsQuiz({
    Key key,
  }) : super(key: key);

  @override
  State<PhysicsQuiz> createState() => _PhysicsQuizState();
}

class _PhysicsQuizState extends State<PhysicsQuiz> {
  var _quiz = [
    {
      'id': 1,
      'question':
          "Kelompok besaran di bawah ini yang termasuk besaran vektor adalah ... ",
      'answers': [
        {'text': 'A. Kelajuan, kuat arus, gaya', 'score': 0},
        {"text": 'B. Energi, usaha, banyak mol', 'score': 0},
        {"text": 'C. Kecepatan, momentum, kuat arus listrik', 'score': 10},
        {"text": 'D. Tegangan, intensitas cahaya, gaya', 'score': 0}
      ]
    },
    {
      'id': 2,
      'question': "Nada bunyi akan terdengar lemah jika ... ",
      'answers': [
        {'text': 'A. Frekuensinya tinggi', 'score': 0},
        {"text": 'B. Frekuensinya rendah', 'score': 0},
        {"text": 'C. Amplitudonya besar', 'score': 0},
        {"text": 'D. Amplitudonya kecil', 'score': 10}
      ]
    },
    {
      'id': 3,
      'question': "Satuan internasional yang digunakan untuk gaya adalah ...",
      'answers': [
        {'text': 'A. Ampere', 'score': 0},
        {"text": 'B. Celcius', 'score': 0},
        {"text": 'C. Candela', 'score': 0},
        {"text": 'D. Newton', 'score': 10}
      ]
    },
    {
      'id': 4,
      'question': "Yang bukan besaran pokok adalah ...",
      'answers': [
        {'text': 'A. Luas', 'score': 10},
        {"text": 'B. Waktu', 'score': 0},
        {"text": 'C. Suhu', 'score': 0},
        {"text": 'D. Massa', 'score': 0}
      ]
    },
    {
      'id': 5,
      'question': "Yang termasuk benda magnetis antara lain yaitu ...",
      'answers': [
        {'text': 'A. Alumunium, kayu, besi', 'score': 0},
        {"text": 'B. Besi, baja, seng bnr', 'score': 10},
        {"text": 'C. Karet, besi, timah', 'score': 0},
        {"text": 'D. Kayu, karet, kertas', 'score': 0}
      ]
    },
    {
      'id': 6,
      'question': "Satuan internasional untuk suhu adalah ...",
      'answers': [
        {'text': 'A. Kelvin', 'score': 10},
        {"text": 'B. Celcius', 'score': 0},
        {"text": 'C. Fahrenheit', 'score': 0},
        {"text": 'D. Derajat', 'score': 0}
      ]
    },
    {
      'id': 7,
      'question':
          "Cangkir yang diisi air panas maka gagangnya ikut terasa panas. Hal ini menujukkan bahwa terjadi perpindahan panas secara …",
      'answers': [
        {'text': 'A. Konduksi', 'score': 10},
        {"text": 'B. Kondensasi', 'score': 0},
        {"text": 'C. Konveksi', 'score': 0},
        {"text": 'D. Radiasi', 'score': 0}
      ]
    },
    {
      'id': 8,
      'question': "Benda yang dapat ditarik oleh magnet disebut benda ...",
      'answers': [
        {'text': 'A. Nonmagnetis', 'score': 0},
        {"text": 'B. Magnetis', 'score': 10},
        {"text": 'C. Feromagnetis', 'score': 0},
        {"text": 'D. Medan Magnet', 'score': 0}
      ]
    },
    {
      'id': 9,
      'question': "72 km/jam apabila dikonversi menjadi m/s adalah...",
      'answers': [
        {'text': 'A. 10', 'score': 0},
        {"text": 'B. 20', 'score': 10},
        {"text": 'C. 25', 'score': 0},
        {"text": 'D. 30', 'score': 0}
      ]
    },
    {
      'id': 10,
      'question': "pada peristiwa pengereman mobil terjadi gaya ...",
      'answers': [
        {'text': 'A. Gaya gravitasi', 'score': 0},
        {"text": 'B. Gaya gesek', 'score': 10},
        {"text": 'C. Gaya magnet', 'score': 0},
        {"text": 'D. Gaya pegas', 'score': 0}
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
