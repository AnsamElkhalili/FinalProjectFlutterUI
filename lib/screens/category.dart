import 'foodItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/screens/newMeal.dart';
import 'package:flutter_application_final/screens/listItme.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List g = [
      FoodItemWidget("Sandwich", 'assets/images/donut-icon.png'),
      FoodItemWidget("Add New Food", 'assets/images/add.png'),
      FoodItemWidget("Profile", 'assets/images/user.png'),

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
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListItem()),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewMeal()),
                  );
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                }

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
