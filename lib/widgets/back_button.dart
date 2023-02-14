import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
