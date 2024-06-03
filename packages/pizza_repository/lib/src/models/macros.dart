// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pizza_repository/src/entities/entities.dart';

class Macros {
  int calories;
  int proteins;
  int fat;
  int carbs;
  Macros({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  MacrosEntity toEntity() {
    return MacrosEntity(
      calories: calories,
      proteins: proteins,
      fat: fat,
      carbs: carbs,
    );
  }

  static Macros
}
