import 'package:pizza_repository/pizza_repository.dart';

abstract class PizzaRepo {
  Future<List<Pizza>> getPizzas();
  Future<Pizza> getPizzaById(String id);
}
