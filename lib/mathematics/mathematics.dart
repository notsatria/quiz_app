import 'package:flutter/material.dart';
import './mathematics_quiz.dart';
import '../widgets/starting.dart';

class Mathematics extends StatefulWidget {
  const Mathematics({
    Key key,
  }) : super(key: key);

  @override
  State<Mathematics> createState() => _MathematicsState();
}

class _MathematicsState extends State<Mathematics> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                child: BackButton(),
                alignment: Alignment.topLeft,
              ),
              StartingScreen(
                categoryTitle: 'Mathematics',
                categoryImage:
                    'https://cdn-icons-png.flaticon.com/512/7189/7189960.png',
                startPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MathematicsQuiz()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
