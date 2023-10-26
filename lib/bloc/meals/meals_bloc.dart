import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/meals/meals_events.dart';
import 'package:meals_app/bloc/meals/meals_state.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitialState()) {
    on<LoadMealsEvent>(_loadMeals);
    on<ToggleFavoriteMealEvent>(_toggleFavoriteMeal);
  }

  FutureOr<void> _loadMeals(
    MealsEvent event,
    Emitter<MealsState> emit,
  ) async {
    emit(MealsLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(const MealsLoadedState(meals: dummyMeals, favorites: []));
  }

  void _toggleFavoriteMeal(
    ToggleFavoriteMealEvent event,
    Emitter<MealsState> emit,
  ) {
    if (state.favorites.contains(event.meal)) {
      final meals = state.favorites
          .where((element) => element.id != event.meal.id)
          .toList();
      emit(state.copyWith(favorites: meals));
      return;
    }
    emit(state.copyWith(favorites: [...state.favorites, event.meal]));
  }
}
