import 'package:flutter/material.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/SignUp.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
        child: Container(
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
                      height: 20,
                    ),
                    Text(
                      "WELCOME TO Foody APP",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 17, 84, 125)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "SIGN IN",
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
                        child:
                            Image.asset('assets/images/healthy-food-icon.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                buildTextField("Email", false, Icons.email),
                buildTextField("Password", true, Icons.privacy_tip_sharp),

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
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text("SIGN IN",
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
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text("SIGN Up",
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
