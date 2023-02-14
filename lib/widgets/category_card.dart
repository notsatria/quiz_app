import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String image;
  final String title;
  final Function cardPressed;
  const Category({Key key, this.image, this.title, this.cardPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cardPressed,
      splashColor: Colors.amber,
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          height: 200,
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                image,
                width: MediaQuery.of(context).size.width / 3,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
