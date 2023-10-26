import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealsInitialState extends MealsState {
  MealsInitialState() : super(meals: []);
}

class MealsLoadedState extends MealsState {
  const MealsLoadedState({required List<Meal> meals}) : super(meals: meals);
}

class MealsLoadingState extends MealsState {
  MealsLoadingState() : super(meals: []);
}

@immutable
class MealsState {
  final List<Meal> meals;
  const MealsState({required this.meals});
}
