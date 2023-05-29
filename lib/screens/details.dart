import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_final/meal.dart';
import 'package:flutter_application_final/db_provider.dart';
import 'package:flutter_application_final/screens/Cart.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/newMeal.dart';
import 'package:flutter_application_final/screens/listItme.dart';
import 'package:flutter_application_final/screens/updateMeal.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';

class Details extends StatefulWidget {
  final Meal meal;

  const Details({required this.meal});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override

  // final Meal nmeal;

  // const _DetailsState({required this.nmeal})
  num count = 0;

  Widget build(BuildContext context) {
    widget.meal;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Color.fromARGB(255, 17, 84, 125),
      ),
      body: Consumer<DbProvider>(builder: (context, provider, x) {
        return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 10,
                              child: Center(
                                child: Column(children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0)),
                                      child: Image.asset(widget.meal.image!),
                                    ),
                                  ),
                                  Text(
                                    widget.meal.name!,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 17, 84, 125),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          right: 15, left: 15, top: 10),
                                      child: Text(
                                        widget.meal.details!,
                                        maxLines: 10,
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.justify,
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Price: " +
                                                widget.meal.price!.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                          child: FloatingActionButton.extended(
                                        heroTag: 'update',
                                        label: Text('Update Food'), // <-- Text
                                        backgroundColor:
                                            Color.fromARGB(255, 17, 84, 125),
                                        icon: Icon(
                                          // <-- Icon
                                          Icons.add_card,
                                          size: 25.0,
                                        ),
                                        onPressed: () async {
                                          // print(
                                          //     await provider.getMealByIdFromDb(
                                          //         widget.meal.id!));
                                          // Meal meal =
                                          //     await provider.getMealByIdFromDb(
                                          //         widget.meal.id!);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateMeal(meal: widget.meal)),
                                          );
                                        },
                                      )),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                          child: FloatingActionButton.extended(
                                        heroTag: 'delete',
                                        label: Text('Delete Food'), // <-- Text
                                        backgroundColor: Colors.red[600],
                                        icon: Icon(
                                          // <-- Icon
                                          Icons.delete,
                                          size: 25.0,
                                        ),
                                        onPressed: () async {
                                          provider.deleteMealFromDb(
                                              widget.meal.id!);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListItem()),
                                          );
                                        },
                                      )),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ]),
                              ))),
                    ]),
              ),
            ));
      }),

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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
  }
}
