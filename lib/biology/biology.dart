import 'package:flutter/material.dart';
import '../biology/biology_quiz.dart';
import '../widgets/starting.dart';

class Biology extends StatefulWidget {
  const Biology({
    Key key,
  }) : super(key: key);

  @override
  State<Biology> createState() => _BiologyState();
}

class _BiologyState extends State<Biology> {
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
                  categoryTitle: 'Biology',
                  categoryImage:
                      'https://cdn-icons-png.flaticon.com/512/7190/7190003.png',
                  startPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => BiologyQuiz())))),
            ],
          ),
        ),
      ),
    );
  }
}
