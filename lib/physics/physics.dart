import 'package:flutter/material.dart';
import '../physics/physics_quiz.dart';
import '../widgets/starting.dart';

class Physics extends StatefulWidget {
  const Physics({
    Key key,
  }) : super(key: key);

  @override
  State<Physics> createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
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
                  categoryTitle: 'Physics',
                  categoryImage:
                      'https://cdn-icons-png.flaticon.com/512/7190/7190018.png',
                  startPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => PhysicsQuiz())))),
            ],
          ),
        ),
      ),
    );
  }
}
