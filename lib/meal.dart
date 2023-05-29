class Meal {
  int? id;
  String? name;
  String? details;
  num? price;
  String? image;

  Meal({
    this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.image,
  });
 
  Meal.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    details = map['details'];
    price = map['price'];
    image = map['image'];
  }
  toMap() {
    return {"name": name, "details": details, "price": price,"image":image};
  }
}
