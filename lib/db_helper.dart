import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_final/meal.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = databasePath + "/food.db";
    database = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE Meals (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, details TEXT, price INTEGER,image TEXT)');
    });
  }

  Future<int> insertNewMeal(Meal meal) async {
    try {
      int rowId = await database.insert('Meals', meal.toMap());
      toast("Success Data");
      return rowId;
    } on Exception catch (e) {
      return 0;
    }
  }

  Future<List<Meal>> getAllMeals() async {
    //await Future.delayed(const Duration(seconds: 3));
    List<Map<String, dynamic>> results = await database.query('Meals');
    // print(results);
    List<Meal> meals = results.map((e) => Meal.fromMap(e)).toList();

    return meals;
  }

  Future<List<Meal>> getMealById(int id) async {
    List<Map> results = await database.query('Meals', where: 'id=$id');
    List<Meal> meals = results.map((e) => Meal.fromMap(e)).toList();
    return meals;
  }

  deleteMeal(int id) async {
    await database.delete('Meals', where: 'id=$id');
    toast("Success Data");
  }

  updateMeal(Meal meal) async {
    await database.update('Meals', meal.toMap(), where: 'id=${meal.id}');
  }

  Future<bool?> toast(String message) {
    Fluttertoast.cancel();
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        fontSize: 15.0);
  }
}
