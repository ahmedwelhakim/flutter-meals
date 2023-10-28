import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';

@immutable
class MealsState extends Equatable {
  final List<MealEntity>? meals;
  final List<MealEntity>? favorites;

  const MealsState({this.meals, this.favorites});

  @override
  List<Object?> get props => [meals, favorites];
}

class MealsInitialState extends MealsState {
  const MealsInitialState() : super(meals: const [], favorites: const []);
}

class MealsLoadingState extends MealsState {}

class MealsLoadedSuccessfulState extends MealsState {
  final List<MealEntity> meals;

  MealsLoadedSuccessfulState({
    required this.meals,
  });

  @override
  List<Object?> get props => meals.map((e) => e.id).toList();
}

class MealsCategoriesLoadingState extends MealsState {}

class MealsCategoriesLoadedSuccessfullState extends MealsState {
  final List<CategoryEntity> categories;

  MealsCategoriesLoadedSuccessfullState({required this.categories});

  @override
  List<Object?> get props => categories.map((e) => e.id).toList();
}

class MealsErrorState extends MealsState {
  final String errorMessage;

  MealsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class MealsFavoritesState extends MealsState {
  final List<MealEntity> favorites;

  MealsFavoritesState({required this.favorites});
}
