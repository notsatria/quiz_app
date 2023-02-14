import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function buttonHandler;
  final dataInput;
  const Answer({this.dataInput, @required this.buttonHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      height: 50,
      child: OutlinedButton(
        onPressed: buttonHandler,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  dataInput.substring(0, 2),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              dataInput.substring(2),
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
