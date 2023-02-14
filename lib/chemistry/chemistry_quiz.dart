import 'package:flutter/material.dart';
import '../widgets/answer.dart';
import '../widgets/question.dart';
import '../widgets/result.dart';

class ChemistryQuiz extends StatefulWidget {
  const ChemistryQuiz({
    Key key,
  }) : super(key: key);

  @override
  State<ChemistryQuiz> createState() => _ChemistryQuizState();
}

class _ChemistryQuizState extends State<ChemistryQuiz> {
  var _quiz = [
    {
      'id': 1,
      'question':
          "Atom berasal dari bahasa Yunani \"atomos\" yang berarti ... ",
      'answers': [
        {'text': 'A. Lebih kecil', 'score': 0},
        {"text": 'B. Sangat kecil', 'score': 0},
        {"text": 'C. Tidak dapat dibagi lagi', 'score': 10},
        {"text": 'D. Tidak dapat teruai', 'score': 0}
      ]
    },
    {
      'id': 2,
      'question': "Unsur besi di dalam tabel periodik memiliki lambang ... ",
      'answers': [
        {'text': 'A. Be', 'score': 0},
        {"text": 'B. Fe', 'score': 10},
        {"text": 'C. N', 'score': 0},
        {"text": 'D. Na', 'score': 0}
      ]
    },
    {
      'id': 3,
      'question': "Sifat asam dalam suatu senyawa dipengaruhi oleh unsur ...",
      'answers': [
        {'text': 'A. Oksigen', 'score': 0},
        {"text": 'B. Karbondioksida', 'score': 0},
        {"text": 'C. Nitrogen', 'score': 0},
        {"text": 'D. Hidrogen', 'score': 10}
      ]
    },
    {
      'id': 4,
      'question': "Larutan yang dapat menghantarkan listrik disebut dengan... ",
      'answers': [
        {'text': 'A. Larutan penyangga', 'score': 0},
        {"text": 'B. Larutan non elektrolit', 'score': 0},
        {"text": 'C. Larutan elektrolit', 'score': 10},
        {"text": 'D. Larutan elektromagnetik', 'score': 0}
      ]
    },
    {
      'id': 5,
      'question': "Unsur atom nomor satu di dalam tabel periodik adalah",
      'answers': [
        {'text': 'A. Nitrogen', 'score': 0},
        {"text": 'B. Helium', 'score': 0},
        {"text": 'C. Hidrogen', 'score': 10},
        {"text": 'D. Carbon', 'score': 0}
      ]
    },
    {
      'id': 6,
      'question':
          "Siapakah di antara ilmuwan berikut yang mencetuskan tentang teori atom modern?",
      'answers': [
        {'text': 'A. Stephen Hawking', 'score': 0},
        {"text": 'B. Avogadro', 'score': 0},
        {"text": 'C. Albert Einstein', 'score': 0},
        {"text": 'D. John Dalton', 'score': 10}
      ]
    },
    {
      'id': 7,
      'question': "Partikel atom yang bermuatan netral disebut dengan ...",
      'answers': [
        {'text': 'A. Neutron', 'score': 10},
        {"text": 'B. Proton', 'score': 0},
        {"text": 'C. Elektron', 'score': 0},
        {"text": 'D. Neutral', 'score': 0}
      ]
    },
    {
      'id': 8,
      'question': "Berapakah nomor atom dari unsur Carbon?",
      'answers': [
        {'text': 'A. 2', 'score': 0},
        {"text": 'B. 6', 'score': 10},
        {"text": 'C. 12', 'score': 0},
        {"text": 'D. 14', 'score': 0}
      ]
    },
    {
      'id': 9,
      'question':
          "Dari unsur-unsur di bawah ini, mana yang sering ditemui di tubuh manusia?",
      'answers': [
        {'text': 'A. Phosphorus, nitrogen, calcium', 'score': 0},
        {"text": 'B. Sulfur, sodium, magnesium', 'score': 0},
        {"text": 'C. Copper, zinc, selenium', 'score': 0},
        {"text": 'D. Oxygen, carbon and hydrogen', 'score': 10}
      ]
    },
    {
      'id': 10,
      'question': "Unsur yang memiliki massa paling ringan adalah ...",
      'answers': [
        {'text': 'A. Helium', 'score': 0},
        {"text": 'B. Hidrogen', 'score': 10},
        {"text": 'C. Oksigen', 'score': 0},
        {"text": 'D. Carbon', 'score': 0}
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
