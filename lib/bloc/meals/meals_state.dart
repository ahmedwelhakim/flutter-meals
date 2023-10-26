import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealsInitialState extends MealsState {
  MealsInitialState() : super(meals: [], favorites: []);
}

class MealsLoadedState extends MealsState {
  const MealsLoadedState({
    required List<Meal> meals,
    required List<Meal> favorites,
  }) : super(meals: meals, favorites: favorites);
}

class MealsLoadingState extends MealsState {
  MealsLoadingState() : super(meals: [], favorites: []);
}

@immutable
class MealsState extends Equatable {
  final List<Meal> meals;
  final List<Meal> favorites;

  const MealsState({required this.meals, required this.favorites});

  @override
  List<Object?> get props => [meals, favorites];

  copyWith({
    List<Meal>? meals,
    List<Meal>? favorites,
  }) =>
      MealsState(
        meals: meals ?? this.meals,
        favorites: favorites ?? this.favorites,
      );
}
