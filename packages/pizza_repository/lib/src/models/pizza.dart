// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../entities/entities.dart';
import 'models.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  num price;
  num discount;
  Macros macros;
  Pizza(
    this.pizzaId,
    this.picture,
    this.isVeg,
    this.spicy,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.macros,
  );

  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      picture: picture,
      isVeg: isVeg,
      spicy: spicy,
      name: name,
      description: description,
      price: price,
      discount: discount,
      macros: macros,
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
      entity.pizzaId,
      entity.picture,
      entity.isVeg,
      entity.spicy,
      entity.name,
      entity.description,
      entity.price,
      entity.discount,
      entity.macros,
    );
  }
}
