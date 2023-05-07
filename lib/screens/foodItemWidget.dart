import 'package:flutter/material.dart';

class FoodItemWidget extends StatelessWidget {
  String itemName;
  String image;
  FoodItemWidget(this.itemName, this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Image.asset(
          this.image,
          width: 60,
          height: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          this.itemName,
          style: TextStyle(
              color: Color.fromARGB(200, 17, 84, 125),
              fontWeight: FontWeight.bold),
        ),
      ]),
    ));
  }
}
