import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String data;
  const Question({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30, right: 10, left: 10),
      child: Text(
        data,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
