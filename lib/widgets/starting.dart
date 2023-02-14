import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  final String categoryTitle;
  final String categoryImage;
  final VoidCallback startPressed;
  const StartingScreen(
      {this.categoryTitle, this.categoryImage, this.startPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            categoryTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Image.network(categoryImage),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2,
            child: OutlinedButton(
              onPressed: startPressed,
              child: Text(
                'I\'m Ready!',
                style: const TextStyle(color: Colors.black87),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
