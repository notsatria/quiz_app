import 'package:flutter/material.dart';
import '../widgets/answer.dart';
import '../widgets/question.dart';
import '../widgets/result.dart';

class BiologyQuiz extends StatefulWidget {
  const BiologyQuiz({
    Key key,
  }) : super(key: key);

  @override
  State<BiologyQuiz> createState() => _BiologyQuizState();
}

class _BiologyQuizState extends State<BiologyQuiz> {
  var _quiz = [
    {
      'id': 1,
      'question': "Ilmu yang mempelajari virus disebut",
      'answers': [
        {'text': 'A. Sitologi', 'score': 0},
        {"text": 'B. Mikologi', 'score': 0},
        {"text": 'C. Virologi', 'score': 10},
        {"text": 'D. Bakteriologi', 'score': 0}
      ]
    },
    {
      'id': 2,
      'question':
          "Dalam usaha meningkatkan produksi pangan para peneliti telah berhasil mengembangkan bibit unggul dengan cara hibridasi. Cabang biologi yang mendasarinya adalah...",
      'answers': [
        {'text': 'A. Sitologi', 'score': 0},
        {"text": 'B. Histologi', 'score': 0},
        {"text": 'C. Taksonomi', 'score': 0},
        {"text": 'D. Genetika', 'score': 10}
      ]
    },
    {
      'id': 3,
      'question':
          "Di suatu tempat terdapat kumpulan kelompok belalang,kelompok semut dan kelompok rumput. Kumpulan kelompok tersebut akan membentuk...",
      'answers': [
        {'text': 'A. Ekosistem', 'score': 0},
        {"text": 'B. Komunitas', 'score': 10},
        {"text": 'C. Bioma', 'score': 0},
        {"text": 'D. Biosfer', 'score': 0}
      ]
    },
    {
      'id': 4,
      'question': "Pada pernapasan dada yang berkontraksi adalah otot...",
      'answers': [
        {'text': 'A. Diafragma', 'score': 0},
        {"text": 'B. Pengangkat rusuk', 'score': 0},
        {"text": 'C. Antar tulang rusuk', 'score': 10},
        {"text": 'D. Diafragma dan pengangkat rusuk', 'score': 0}
      ]
    },
    {
      'id': 5,
      'question':
          "Seseorang akan menjalani transplatasi hati. Hati dipelajari pada tingkat organisasi...",
      'answers': [
        {'text': 'A. Sel', 'score': 0},
        {"text": 'B. Jaringan', 'score': 0},
        {"text": 'C. Organ', 'score': 10},
        {"text": 'D. System organ', 'score': 0}
      ]
    },
    {
      'id': 6,
      'question':
          "Berikut ini yang dibutuhkan tumbuhan untuk membuat makananya sendiri, kecuali...",
      'answers': [
        {'text': 'A. Oksigen', 'score': 0},
        {"text": 'B. Oksigen', 'score': 0},
        {"text": 'C. Uap', 'score': 10},
        {"text": 'D. Cahaya matahari', 'score': 0}
      ]
    },
    {
      'id': 7,
      'question':
          "Organel penting yang berfungsi untuk menghasilkan energi adalah?",
      'answers': [
        {'text': 'A. Retikulum Endoplasma', 'score': 0},
        {"text": 'B. Mitokondria', 'score': 10},
        {"text": 'C. Lisosom', 'score': 0},
        {"text": 'D. Ribosom', 'score': 0}
      ]
    },
    {
      'id': 8,
      'question':
          "Hubungan yang saling menguntungkan antar dua organisme disebut?",
      'answers': [
        {'text': 'A. Simbiosis Komensalisme', 'score': 0},
        {"text": 'B. Simbiosis Parasistisme', 'score': 0},
        {"text": 'C. Simbiosis Isoisme', 'score': 0},
        {"text": 'D. Simbiosis Mutualisme', 'score': 10}
      ]
    },
    {
      'id': 9,
      'question':
          "Manakah kategori hewan di bawah ini yang bukan termasuk sebagai hewan vertebrata…",
      'answers': [
        {'text': 'A. Aves', 'score': 0},
        {"text": 'B. Pisces', 'score': 0},
        {"text": 'C. Arthropoda', 'score': 10},
        {"text": 'D. Mamalia', 'score': 0}
      ]
    },
    {
      'id': 10,
      'question':
          "Apakah tingkatan takson terendah yang ada dalam klasifikasi makhluk hidup…",
      'answers': [
        {'text': 'A. Kingdom', 'score': 0},
        {"text": 'B. Genus', 'score': 0},
        {"text": 'C. Ordo', 'score': 0},
        {"text": 'D. Spesies', 'score': 10}
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
