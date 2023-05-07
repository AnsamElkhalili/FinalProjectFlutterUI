import 'foodItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/screens/listItme.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List g = [
      FoodItemWidget("Sweets", 'assets/images/donut-icon.png'),
      FoodItemWidget("Snacks", 'assets/images/snacks-icon.png'),
      FoodItemWidget("Cold Drinks", 'assets/images/drink-icon.png'),
      FoodItemWidget("Hot Drinks", 'assets/images/coffee-icon.png'),
      FoodItemWidget("Pizza", 'assets/images/pizza-food-icon.png'),
      FoodItemWidget("sandwich", 'assets/images/burger-fries-icon.png')
    ];

    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 35,
          ),
          itemCount: g.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListItem()),
                );
                // To do
              },
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 40,
                child: g[index],
              ),
            );
          }),
    );
  }
}
