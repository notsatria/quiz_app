import 'package:flutter/material.dart';
import '../category_screen.dart';

class Result extends StatelessWidget {
  final int inputScore;
  // final VoidCallback resetButton;
  const Result({
    Key key,
    this.inputScore,
  }) : super(key: key);

  // String get resultPhrase {
  //   String resultText;
  //   if (inputScore >= 0) {
  //     resultText = "Keren, score kamu $inputScore";
  //   }
  //   return resultText;
  // }

  // String get getImage {
  //   String resultImage;
  //   if (inputScore >= 0) {
  //     resultImage = 'https://cdn-icons-png.flaticon.com/512/7647/7647539.png';
  //   }
  //   return resultImage;
  // }

  Map<String, String> get finalResult {
    String resultText;
    String resultImage;

    if (inputScore >= 70) {
      resultText = "Keren! Score kamu $inputScore";
      resultImage = 'https://cdn-icons-png.flaticon.com/512/7647/7647539.png';
    }
    if (inputScore >= 30 && inputScore < 70) {
      resultText = "Tingkatkan lagi kemampuanmu! Score kamu $inputScore";
      resultImage = 'https://cdn-icons-png.flaticon.com/512/7273/7273758.png';
    }
    if (inputScore >= 0 && inputScore < 30) {
      resultText = "Belajar lebih banyak lagi! Score kamu $inputScore";
      resultImage = 'https://cdn-icons-png.flaticon.com/512/8858/8858767.png';
    }
    return {
      'resultText': resultText,
      'resultImage': resultImage,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 15),
            width: MediaQuery.of(context).size.width / 2,
            child: Image.network(finalResult['resultImage']),
          ),
          Text(finalResult['resultText']),
          SizedBox(
            height: 15,
          ),
          // TextButton(
          //   onPressed: resetButton,
          //   child: Text("Back to category"),
          // ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => CategoryScreen()))),
            child: Text("Back to Category"),
          ),
        ],
      ),
    );
  }
}
