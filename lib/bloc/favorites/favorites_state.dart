import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class FavoritesInitialState extends FavoritesState {
  FavoritesInitialState() : super(favorites: []);
}

class FavoritesLoadedState extends FavoritesState {
  const FavoritesLoadedState({required List<Meal> favorites})
      : super(favorites: favorites);
}

@immutable
abstract class FavoritesState {
  final List<Meal> favorites;
  const FavoritesState({required this.favorites});
}
