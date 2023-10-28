import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/data/repository/meals_repository_impl.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_events.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitialState()) {
    on<LoadCategoriesEvent>(_loadCategories);
    on<LoadMealsEvent>(_loadMeals);
    on<LoadFavoritesEvent>(_loadFavorites);
    on<ToggleFavoriteMealEvent>(_toggleFavoriteMeal);
  }

  FutureOr<void> _loadCategories(
    LoadCategoriesEvent event,
    Emitter<MealsState> emit,
  ) async {
    emit(MealsCategoriesLoadingState());
    final categories = await MealsRepositoryImpl().getCategories();
    emit(MealsCategoriesLoadedSuccessfullState(categories: categories));
  }

  FutureOr<void> _loadMeals(
    MealsEvent event,
    Emitter<MealsState> emit,
  ) async {
    emit(MealsLoadingState());
    final meals = await MealsRepositoryImpl().getMeals();
    emit(MealsLoadedSuccessfulState(meals: meals));
  }

  void _loadFavorites(LoadFavoritesEvent event, Emitter<MealsState> emit) {
    final currentState = state;
    if (currentState is MealsFavoritesState) {
      emit(MealsFavoritesState(favorites: currentState.favorites));
      return;
    }
    emit(MealsFavoritesState(favorites: const []));
  }

  void _toggleFavoriteMeal(
    ToggleFavoriteMealEvent event,
    Emitter<MealsState> emit,
  ) {
    final currentState = state;
    if (currentState is MealsFavoritesState) {
      final favorites = currentState.favorites;
      if (currentState.favorites.contains(event.meal)) {
        favorites.where((element) => element.id != event.meal.id).toList();
        emit(MealsFavoritesState(favorites: favorites));
        return;
      }
      emit(MealsFavoritesState(favorites: [...favorites, event.meal]));
    }
  }
}
