import 'package:flutter/material.dart';
import 'package:flutter_application_final/screens/Login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "WELCOME TO Foody App",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 17, 84, 125)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 17, 84, 125)),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
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
                            Icons.add,
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
                height: 25,
              ),
              buildTextField("Full Name", false, Icons.person),
              buildTextField("Email", false, Icons.email),
              buildTextField("Password", true, Icons.privacy_tip_sharp),
              buildTextField("Location", false, Icons.location_on_sharp),
              buildTextField("Bank account", false, Icons.pin),
              // SizedBox(
              //   height: 30,
              // ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text("SIGN UP",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 17, 84, 125),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String placeholder, bool isPasswordTextField, IconData test) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(
              test,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
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
          contentPadding: EdgeInsets.only(bottom: 5, right: 15, left: 15),
          hintText: placeholder,
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
