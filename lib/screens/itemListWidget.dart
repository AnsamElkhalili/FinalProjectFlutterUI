import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ItemListWidget extends StatelessWidget {
  String image;
  String name;
  num price;
  num count;

  ItemListWidget(
      {required this.name,
      required this.image,
      required this.price,
      required this.count});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(this.image),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(this.name),
                Text(this.price.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
