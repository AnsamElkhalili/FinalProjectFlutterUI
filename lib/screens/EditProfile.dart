import 'package:flutter/material.dart';
import 'package:flutter_application_final/screens/Cart.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/newMeal.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 17, 84, 125),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          // color: Color.fromARGB(255, 60, 47, 155),
          elevation: 10,
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(1, 229, 39, 58),
                                Colors.white
                              ]),
                          border: Border.all(
                              width: 4,
                              color: Color.fromARGB(150, 17, 84, 125)),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/avatar2.jpg'),
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.red[400]),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField("Full Name", "Ansam", false),
              buildTextField("Email", "ansam@gmail.come", false),
              buildTextField("Password", "*****", true),
              buildTextField("Location", "Gaza", false),
              buildTextField("Bank account", "*****", false),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("SAVE",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[400],
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 20, right: 10, left: 10),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.only(bottom: 5, right: 50, left: 15),
          labelText: labelText,
          //labelStyle: TextStyle(backgroundColor: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle:
              TextStyle(fontSize: 16, color: Color.fromARGB(255, 55, 54, 54)),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
        ),
      ),
    );
  }

  // Widget buildTextField(
  //     String labelText, String placeholder, bool isPasswordTextField) {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: 30),
  //     child: TextField(
  //       obscureText: isPasswordTextField ? isObscurePassword : false,
  //       decoration: InputDecoration(
  //           suffixIcon: isPasswordTextField
  //               ? IconButton(
  //                   icon: Icon(
  //                     Icons.remove_red_eye,
  //                     color: Colors.grey,
  //                   ),
  //                   onPressed: () {
  //                     setState(() {
  //                       isObscurePassword = !isObscurePassword;
  //                     });
  //                   },
  //                 )
  //               : null,
  //           contentPadding: EdgeInsets.only(bottom: 5),
  //           labelText: labelText,
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           hintText: placeholder,
  //           hintStyle: TextStyle(
  //               fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
  //     ),
  //   );
  // }
}
