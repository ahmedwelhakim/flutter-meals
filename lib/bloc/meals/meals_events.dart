import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class LoadMealsEvent extends MealsEvent {}

@immutable
abstract class MealsEvent {}

class ToggleFavoriteMealEvent extends MealsEvent {
  final Meal meal;
  ToggleFavoriteMealEvent(this.meal);
}
