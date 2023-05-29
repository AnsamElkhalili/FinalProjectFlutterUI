import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_final/meal.dart';
import 'package:flutter_application_final/db_provider.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/newMeal.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';

class UpdateMeal extends StatefulWidget {
  final Meal meal;

  const UpdateMeal({required this.meal});

  @override
  _UpdateMealState createState() => _UpdateMealState();
}

class _UpdateMealState extends State<UpdateMeal> {
  @override
  Widget build(BuildContext context) {
    widget.meal;
    return Consumer<DbProvider>(
      builder: (context, provider, x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('New Meal'),
            backgroundColor: Color.fromARGB(255, 17, 84, 125),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      controller: provider.nameController,
                      decoration: InputDecoration(
                        // labelText: "Enter the Meal name",
                        hintText: widget.meal.name.toString(),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: provider.priceController,
                      decoration: InputDecoration(
                        // labelText: "Enter the Meal price",
                        hintText: widget.meal.price.toString(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: provider.detailsController,
                      decoration: InputDecoration(
                        // labelText: "Enter the Meal details",
                        hintText: widget.meal.details.toString(),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: provider.imageController,
                      decoration: InputDecoration(
                        // labelText: "Enter the Meal image",
                        hintText: widget.meal.image.toString(),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        Meal meal = Meal(
                          id: widget.meal.id,
                          name: provider.nameController.text == ""
                              ? widget.meal.name
                              : provider.nameController.text,
                          image: provider.imageController.text == ""
                              ? widget.meal.image
                              : provider.imageController.text,
                          price: provider.priceController.text == ""
                              ? widget.meal.price
                              : double.parse(provider.priceController.text),
                          details: provider.detailsController.text == ""
                              ? widget.meal.details
                              : provider.detailsController.text,
                        );
                        // if (widget.meal) {
                        //   provider.insertMealToDatabase();
                        // } else {
                        //   provider.updateMeal();
                        // }
                        provider.updateMeal(meal);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text("Update Meal",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[600],
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'home',

            //Floating action button on Scaffold
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Icon(Icons.home),
            backgroundColor: Color.fromARGB(255, 17, 84, 125),
            //icon inside button
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //floating action button position to center

          bottomNavigationBar: BottomAppBar(
            //bottom navigation bar on scaffold
            color: Color.fromARGB(255, 17, 84, 125),
            shape: CircularNotchedRectangle(), //shape of notch
            notchMargin:
                5, //notche margin between floating button and bottom appbar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //children inside bottom appbar
              // mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add_card,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewMeal()),
                    );
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
