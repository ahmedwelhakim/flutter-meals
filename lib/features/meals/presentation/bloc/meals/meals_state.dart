import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';

@immutable
class MealsState extends Equatable {
  final List<MealEntity>? meals;
  final List<MealEntity>? favorites;
  final List<CategoryEntity>? categories;
  const MealsState({this.meals, this.favorites, this.categories});

  @override
  List<Object?> get props => [meals, favorites];

  copyWith({
    List<MealEntity>? meals,
    List<MealEntity>? favorites,
    List<CategoryEntity>? categories,
  }) {
    return MealsState(
      meals: meals ?? this.meals,
      favorites: favorites ?? this.favorites,
      categories: categories ?? this.categories,
    );
  }
}

class MealsInitialState extends MealsState {
  const MealsInitialState()
      : super(meals: const [], favorites: const [], categories: const []);
}

class MealsLoadingState extends MealsState {
  const MealsLoadingState({super.meals, super.categories, super.favorites});
}

class MealsLoadedSuccessfulState extends MealsState {
  const MealsLoadedSuccessfulState(
      {super.meals, super.categories, super.favorites});

  @override
  List<Object?> get props => meals!.map((e) => e.id).toList();
}

class MealsCategoriesLoadingState extends MealsState {
  const MealsCategoriesLoadingState(
      {super.meals, super.categories, super.favorites});
}

class MealsCategoriesLoadedSuccessfullState extends MealsState {
  const MealsCategoriesLoadedSuccessfullState(
      {super.meals, super.categories, super.favorites});
  @override
  List<Object?> get props => categories!.map((e) => e.id).toList();
}

class MealsErrorState extends MealsState {
  final String errorMessage;

  const MealsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class MealsFavoritesLoadedState extends MealsState {
  const MealsFavoritesLoadedState({
    super.meals,
    super.categories,
    super.favorites,
  });
}
