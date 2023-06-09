import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_final/db_helper.dart';
import 'package:flutter_application_final/db_provider.dart';
import 'package:flutter_application_final/screens/Cart.dart';
import 'package:flutter_application_final/screens/home.dart';
import 'package:flutter_application_final/screens/Login.dart';
import 'package:flutter_application_final/screens/SignUp.dart';
import 'package:flutter_application_final/screens/splash.dart';
import 'package:flutter_application_final/screens/newMeal.dart';
import 'package:flutter_application_final/screens/details.dart';
import 'package:flutter_application_final/screens/category.dart';
import 'package:flutter_application_final/screens/listItme.dart';
import 'package:flutter_application_final/screens/EditProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDb();
  runApp(ChangeNotifierProvider<DbProvider>(
      create: (context) => DbProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash());
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.red,
    //   ),
    //   //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
