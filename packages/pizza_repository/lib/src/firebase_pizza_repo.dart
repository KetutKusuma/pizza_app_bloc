import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:pizza_repository/src/models/models.dart';
import 'package:pizza_repository/src/pizza_repo.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection.get().then(
            (value) => value.docs.map((e) {
              var yeh = PizzaEntity.fromDocument(
                e.data(),
              );
              print("yeh : $yeh");
              return Pizza.fromEntity(
                PizzaEntity.fromDocument(
                  e.data(),
                ),
              );
            }).toList(),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Pizza> getPizzaById(String id) {
    // TODO: implement getPizzaById
    throw UnimplementedError();
  }
}
