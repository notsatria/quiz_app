import 'package:flutter/material.dart';
import 'package:quiz_app/chemistry/chemistry.dart';
import '/mathematics/mathematics.dart';
import '/physics/physics.dart';
import '../biology/biology.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Choose your category",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Category(
                image:
                    "https://cdn-icons-png.flaticon.com/512/7190/7190003.png",
                title: "Biology",
                cardPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) {
                  return Biology();
                }))),
              ),
              Category(
                image:
                    "https://cdn-icons-png.flaticon.com/512/7190/7190018.png",
                title: "Physics",
                cardPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Physics()))),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Category(
                image:
                    "https://cdn-icons-png.flaticon.com/512/7189/7189960.png",
                title: "Mathematics",
                cardPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mathematics())),
              ),
              Category(
                image:
                    "https://cdn-icons-png.flaticon.com/512/7189/7189966.png",
                title: "Chemistry",
                cardPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Chemistry()))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
