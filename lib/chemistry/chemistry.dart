import 'package:flutter/material.dart';
import './chemistry_quiz.dart';
import '../widgets/starting.dart';

class Chemistry extends StatefulWidget {
  const Chemistry({
    Key key,
  }) : super(key: key);

  @override
  State<Chemistry> createState() => _ChemistryState();
}

class _ChemistryState extends State<Chemistry> {
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
                categoryTitle: 'Chemistry',
                categoryImage:
                    'https://cdn-icons-png.flaticon.com/512/7189/7189966.png',
                startPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ChemistryQuiz()),
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
