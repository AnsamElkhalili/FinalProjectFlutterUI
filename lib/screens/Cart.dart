import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/details.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';
import 'package:flutter_application_final/screens/itemListWidget.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List entries = [
  //   ItemListWidget(
  //       name: "Hot dog", image: 'assets/images/s.jpg', price: 2.5, count: 2),
  //   ItemListWidget(
  //       name: "Bacon", image: 'assets/images/aa.jpg', price: 2.5, count: 5),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Cart'),
        //   backgroundColor: Color.fromARGB(255, 17, 84, 125),
        // ),
        // body: Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //           colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
        //   child: Column(children: [
        //     SizedBox(
        //       height: 30,
        //     ),
        //     Text(
        //       'Total Price : 125',
        //       style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 25,
        //           color: Color.fromARGB(255, 17, 84, 125)),
        //     ),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     Divider(
        //       color: Colors.grey[600],
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Text(
        //       "Items:",
        //       style: TextStyle(
        //           fontSize: 20, color: Color.fromARGB(255, 17, 84, 125)),
        //     ),
        //     SizedBox(
        //       height: 5,
        //     ),
        //     Expanded(
        //         child: ListView.builder(
        //             padding: const EdgeInsets.all(8),
        //             itemCount: entries.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               return Card(
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(10.0),
        //                   ),
        //                   margin: EdgeInsets.only(top: 15.0, right: 12, left: 12),
        //                   color: Color.fromARGB(255, 255, 241, 241),
        //                   elevation: 5.0,
        //                   child: Center(
        //                       child: Material(
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10.0),
        //                     ),
        //                     color: Colors.red[50],
        //                     child: ListTile(
        //                       leading: CircleAvatar(
        //                         radius: 28,
        //                         backgroundImage: AssetImage(entries[index].image),
        //                       ),
        //                       title: Text(
        //                         entries[index].name,
        //                         style: TextStyle(
        //                             color: Color.fromARGB(255, 17, 84, 125),
        //                             fontWeight: FontWeight.bold),
        //                       ),
        //                       subtitle: Text('Price: ${entries[index].price} '
        //                           r"$"
        //                           ' \nCount: ${entries[index].count}'),
        //                       trailing: IconButton(
        //                           icon: Icon(Icons.delete),
        //                           color: Colors.red[400],
        //                           onPressed: () {}),
        //                     ),
        //                   )));
        //             })),
        //     Row(children: [
        //       SizedBox(
        //         width: 10,
        //       ),
        //       Expanded(
        //           child: ElevatedButton(
        //         onPressed: () {},
        //         child: Text("Checkout",
        //             style: TextStyle(
        //                 fontSize: 15, letterSpacing: 2, color: Colors.white)),
        //         style: ElevatedButton.styleFrom(
        //           primary: Color.fromARGB(255, 17, 84, 125),
        //           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //         ),
        //       )),
        //       SizedBox(
        //         width: 20,
        //       ),
        //     ]),
        //     SizedBox(
        //       height: 50,
        //     ),
        //   ]),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'home',

        //   //Floating action button on Scaffold
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Home()),
        //     );
        //   },
        //   child: Icon(Icons.home),
        //   backgroundColor: Color.fromARGB(255, 17, 84, 125),
        //   //icon inside button
        // ),

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // //floating action button position to center

        // bottomNavigationBar: BottomAppBar(
        //   //bottom navigation bar on scaffold
        //   color: Color.fromARGB(255, 17, 84, 125),
        //   shape: CircularNotchedRectangle(), //shape of notch
        //   notchMargin:
        //       5, //notche margin between floating button and bottom appbar
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     //children inside bottom appbar
        //     // mainAxisSize: MainAxisSize.max,
        //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       IconButton(
        //         icon: Icon(
        //           Icons.add_card,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => Cart()),
        //           );
        //         },
        //       ),
        //       SizedBox(
        //         width: 15,
        //       ),
        //       IconButton(
        //         icon: Icon(
        //           Icons.person,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => EditProfile()),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        );

    //   Container(
    //       height: 100,
    //       color: Colors.green,
    //       //padding: EdgeInsets.all(20),
    //       //margin: EdgeInsets.all(2),
    //       child: Center(
    //         child: Material(
    //           color: Colors.blue,
    //           child: ListTile(
    //             leading: CircleAvatar(
    //               radius: 28,
    //               backgroundImage: AssetImage(entries[index].image),
    //             ),
    //             title: Text(entries[index].name),
    //             subtitle:
    //                 Text(entries[index].price.toString() + "\n count 3 "),
    //             trailing: const Icon(Icons.delete),
    //             onTap: () {},
    //           ),
    //         ),
    //       ));
    // });
  }
}
