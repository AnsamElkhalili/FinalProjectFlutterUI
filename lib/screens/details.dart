import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_final/screens/Cart.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';

class Details extends StatefulWidget {
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  num count = 0;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Color.fromARGB(255, 17, 84, 125),
      ),
      body: Container(
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
                                    child:
                                        Image.asset('assets/images/ssss.jpg'),
                                  ),
                                ),
                                Text(
                                  "Hamdog",
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
                                      "Some Details To Do: a flattened disk of bread dough topped with some combination of olive oil,oregano, tomato, olives, mozzarella or other cheese,and many other ingredients ",
                                      maxLines: 10,
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.justify,
                                    )),
                                Container(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Price: 30' r"$",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 118,
                                        ),
                                        IconButton(
                                            color: Colors.red[600],
                                            onPressed: () {
                                              if (count > 0) {
                                                count--;
                                                setState(() {});
                                              }
                                            },
                                            icon: Icon(
                                              Icons.remove_circle,
                                              size: 35.0,
                                            )),
                                        Text('${count}'),
                                        IconButton(
                                            color: Colors.red[600],
                                            onPressed: () {
                                              count++;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.add_circle,
                                              size: 35.0,
                                            )),
                                        SizedBox(
                                          width: 15,
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
                                      heroTag: 'cart',
                                      label: Text('Add to Cart'), // <-- Text
                                      backgroundColor:
                                          Color.fromARGB(255, 17, 84, 125),
                                      icon: Icon(
                                        // <-- Icon
                                        Icons.shopping_cart,
                                        size: 25.0,
                                      ),
                                      onPressed: () {},
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
          )),
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
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
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
