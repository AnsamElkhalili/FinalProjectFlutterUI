import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_final/db_provider.dart';
import 'package:flutter_application_final/screens/Cart.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/newMeal.dart';
import 'package:flutter_application_final/screens/details.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';
import 'package:flutter_application_final/screens/itemListWidget.dart';

class ListItem extends StatelessWidget {
  // List entries = [
  //   ItemListWidget(
  //       name: "Hot dog", image: 'assets/images/s.jpg', price: 2.5, count: 0),
  //   ItemListWidget(
  //       name: "Bacon", image: 'assets/images/aa.jpg', price: 2.5, count: 0),
  //   ItemListWidget(
  //       name: "Bagel toast",
  //       image: 'assets/images/sss.jpg',
  //       price: 2.5,
  //       count: 0),
  //   ItemListWidget(
  //       name: "Hamdog", image: 'assets/images/ssss.jpg', price: 2.5, count: 0),
  //   ItemListWidget(
  //       name: "Gyro", image: 'assets/images/sssss.jpg', price: 2.5, count: 0),
  // ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Foods'),
          backgroundColor: Color.fromARGB(255, 17, 84, 125),
        ),
        body: Consumer<DbProvider>(builder: (context, provider, x) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
            child: Row(
              children: [
                Expanded(
                    child: provider.allMeals == null
                        ? SizedBox()
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: provider.allMeals!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  margin: EdgeInsets.only(
                                      top: 15.0, right: 12, left: 12),
                                  color: Color.fromARGB(255, 255, 241, 241),
                                  elevation: 5.0,
                                  child: Center(
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.red[50],
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 28,
                                          backgroundImage: AssetImage(provider
                                              .allMeals![index].image
                                              .toString()),
                                        ),
                                        title: Text(
                                          provider.allMeals![index].name
                                              .toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 17, 84, 125),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                            'Price: ${provider.allMeals![index].price} '
                                            r"$"),
                                        trailing: IconButton(
                                          icon: Icon(Icons.arrow_forward),
                                          color:
                                              Color.fromARGB(255, 17, 84, 125),
                                          onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Details(
                                                    meal: provider
                                                        .allMeals![index])),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }))
              ],
            ),
          );
          floatingActionButton:
          FloatingActionButton(
            //Floating action button on Scaffold
            heroTag: 'home',

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Icon(Icons.home),
            backgroundColor: Color.fromARGB(255, 17, 84, 125),
            //icon inside button
          );

          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked;
          //floating action button position to center

          bottomNavigationBar:
          BottomAppBar(
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
          );
        }));
  }
}
