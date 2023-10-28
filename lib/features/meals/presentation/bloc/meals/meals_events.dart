import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';

@immutable
abstract class MealsEvent {}

class LoadMealsEvent extends MealsEvent {}

class LoadCategoriesEvent extends MealsEvent {}

class ToggleFavoriteMealEvent extends MealsEvent {
  final MealEntity meal;
  ToggleFavoriteMealEvent(this.meal);
}

class LoadFavoritesEvent extends MealsEvent {}
