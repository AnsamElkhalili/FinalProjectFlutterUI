import 'dart:ffi';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/meal.dart';
import 'package:flutter_application_final/db_helper.dart';

class DbProvider extends ChangeNotifier {
  DbProvider() {
    getAllMealsFromDb();
  }

  List<Meal>? allMeals;
  // bool isMale = true;
  int id = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  // changeGender() {
  //   isMale = !isMale;
  //   notifyListeners();
  // }

  getAllMealsFromDb() async {
    log(1111111111);
    allMeals = await DbHelper.dbHelper.getAllMeals();
    log(allMeals!.length);
    notifyListeners();
  }

  getMealByIdFromDb(int id) async {
    log(id);
    List<Meal> meal = await DbHelper.dbHelper.getMealById(id);
    // print("aaaaaaaaaa");
    // print(meal);
    notifyListeners();
  }

  insertMealToDatabase() async {
    Meal meal = Meal(
      name: nameController.text,
      details: detailsController.text,
      price: int.parse(priceController.text),
      image: imageController.text,
    );

    int id = await DbHelper.dbHelper.insertNewMeal(meal);
    meal.id = id;
    allMeals!.add(meal);
    // cleanVariables();
    notifyListeners();
  }

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

  // Meal meal = Meal(
  //     name: "Hot dog",
  //     details:
  //         "Some Details To Do: a flattened disk of bread dough topped with some combination of olive oil,oregano, tomato, olives, mozzarella or other cheese,and many other ingredients ",
  //     price: 2.5,
  //     image: 'assets/images/s.jpg');

  // Meal meal2 = Meal(
  //     name: "Bacon",
  //     details:
  //         "Some Details To Do: a flattened disk of bread dough topped with some combination of olive oil,oregano, tomato, olives, mozzarella or other cheese,and many other ingredients ",
  //     price: 3.5,
  //     image: 'assets/images/aa.jpg');

  // Meal meal3 = Meal(
  //     name: "Bagel toast",
  //     details:
  //         "Some Details To Do: a flattened disk of bread dough topped with some combination of olive oil,oregano, tomato, olives, mozzarella or other cheese,and many other ingredients ",
  //     price: 2.5,
  //     image: 'assets/images/sss.jpg');

//   GlobalKey<FormState> formKey = GlobalKey();
//   insertNewMeal() async {
// // validation
//   bool result =   formKey.currentState!.validate();
//   if(result){
//      Meal meal = Meal(
//           name: nameController.text,
//           gpa: double.parse(gpaController.text),
//           isMale: isMale);
//       int newId = await DbHelper.dbHelper.insertNewMeal(meal);
//       meal.id = newId;
//       allMeals!.add(meal);
//       notifyListeners();
//   }

//   }

  deleteMealFromDb(int id) async {
    await DbHelper.dbHelper.deleteMeal(id);
    allMeals!.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  // navigateToEditScreen(Student student, BuildContext context) {
  //   nameController.text = student.name ?? '';
  //   gpaController.text = student.gpa.toString();
  //   isMale = student.isMale;
  //   id = student.id!;
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //     return NewStudent(false);
  //   }));
  // }

  updateMeal(Meal meal) async {
    // Meal meal = Meal(
    //     id: id,
    //     name: nameController.text,
    //     price: int.parse(priceController.text),
    //     details: detailsController.text,
    //     image: imageController.text);
    print("aaaaaa");
    print(meal.toMap());
    await DbHelper.dbHelper.updateMeal(meal);

    getAllMealsFromDb();
  }

  // convertListToString() {
  //   List<String> names = ["omar", "ahmed", "ali"];
  //   dynamic result = jsonEncode(names);
  //   dynamic result2 = jsonDecode(result);
  //   print(result2);
  //   print(result2.runtimeType);
  // }
}
