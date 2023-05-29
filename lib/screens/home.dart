import 'indicator.dart';
import 'banner_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_final/screens/Cart.dart';
import 'package:flutter_application_final/screens/newMeal.dart';
import 'package:flutter_application_final/screens/category.dart';
import 'package:flutter_application_final/screens/appbanner.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _secectedIndex = 0;

  List<AppBanner> appBannerList = [
    AppBanner(1, 'title', 'assets/images/a.jpg'),
    AppBanner(1, 'title', 'assets/images/aaa.jpg'),
    AppBanner(1, 'title', 'assets/images/aaaa.jpg'),
    AppBanner(1, 'title', 'assets/images/ss.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.amber,

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(1, 229, 39, 58), Colors.white])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: const Text(
                "Welcome, Foody App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 17, 84, 125)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              height: 160,
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _secectedIndex = index;
                    });
                  },
                  controller: PageController(viewportFraction: 0.7),
                  itemCount: appBannerList.length,
                  itemBuilder: (context, index) {
                    var banner = appBannerList[index];
                    var _scale = _secectedIndex == index ? 1.0 : 0.8;
                    return TweenAnimationBuilder(
                      duration: const Duration(microseconds: 350),
                      tween: Tween(begin: _scale, end: _scale),
                      curve: Curves.ease,
                      child: bannerItem(
                        appBanner: banner,
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    appBannerList.length,
                    (index) => Indicator(
                        isActive: _secectedIndex == index ? true : false)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: const Text(
                "MENU",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 17, 84, 125)),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            //Image.asset('assets/images/nnn.png'),
            Category(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'home',
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
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
