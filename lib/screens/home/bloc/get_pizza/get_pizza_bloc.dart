// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'get_pizza_event.dart';
part 'get_pizza_state.dart';

class GetPizzaBloc extends Bloc<GetPizzaEvent, GetPizzaState> {
  PizzaRepo _pizzaRepo;
  GetPizzaBloc(
    this._pizzaRepo,
  ) : super(GetPizzaInitial()) {
    on<GetPizza>((event, emit) async {
      emit(GetPizzaProcess());
      try {
        List<Pizza> pizzas = await _pizzaRepo.getPizzas();
        print("length : ${pizzas.length}");
        emit(GetPizzaSuccess(pizzas));
      } catch (e) {
        log(e.toString());
        emit(GetPizzaFailure());
      }
    });
  }
}
