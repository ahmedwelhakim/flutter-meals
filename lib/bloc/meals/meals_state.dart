import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealsInitialState extends MealsState {
  final List<Meal> meals = [];
}

class MealsLoadedState extends MealsState {
  final List<Meal> meals;
  MealsLoadedState({required this.meals});
}

class MealsLoadingState extends MealsState {}

@immutable
class MealsState {}
