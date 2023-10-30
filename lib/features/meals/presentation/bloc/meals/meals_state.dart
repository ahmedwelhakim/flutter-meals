import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';

enum MealsStatus {
  initial,
  loading,
  loaded,
  error,
}

enum CategoriesStatus {
  initial,
  loading,
  loaded,
  error,
}

enum FavoritesStatus {
  initial,
  loading,
  loaded,
  error,
}

@immutable
class MealsState extends Equatable {
  final List<MealEntity>? meals;
  final MealsStatus? mealStatus;
  final List<MealEntity>? favorites;
  final List<CategoryEntity>? categories;
  final CategoriesStatus? categoriesStatus;

  const MealsState({
    this.meals,
    this.favorites,
    this.categories,
    this.mealStatus,
    this.categoriesStatus,
  });

  @override
  List<Object?> get props {
    final props = [];
    meals?.forEach((element) {
      props.add(element);
    });
    favorites?.forEach((element) {
      props.add(element);
    });
    categories?.forEach((element) {
      props.add(element);
    });
    props.add(mealStatus);
    props.add(categoriesStatus);
    return props;
  }

  MealsState copyWith({
    List<MealEntity>? meals,
    MealsStatus? mealStatus,
    List<MealEntity>? favorites,
    FavoritesStatus? favoritesStatus,
    List<CategoryEntity>? categories,
    CategoriesStatus? categoriesStatus,
  }) {
    return MealsState(
      meals: meals ?? this.meals,
      favorites: favorites ?? this.favorites,
      categories: categories ?? this.categories,
      mealStatus: mealStatus ?? this.mealStatus,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
    );
  }
}
