import 'package:pizza_repository/src/entities/entities.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicey;
  String name;
  String description;
  double price;
  double discount;
  List<MacrosEntity> macros;

  PizzaEntity({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicey,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toDocument() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      "isVeg": isVeg,
      "spicey": spicey,
      "name": name,
      "description": description,
      "price": price,
      "discount": discount,
      "macros": macros,
    };
  }

  PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
      pizzaId: doc['pizzaId'],
      picture: doc['picture'],
      isVeg: doc['isVeg'],
      spicey: doc['spicey'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      discount: doc['discount'],
      macros: doc['macros'],
    );
  }
}
