import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/meals/meals_events.dart';
import 'package:meals_app/bloc/meals/meals_state.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitialState()) {
    on<LoadMealsEvent>(_loadMeals);
  }

  FutureOr<void> _loadMeals(
    MealsEvent event,
    Emitter<MealsState> emit,
  ) async {
    emit(MealsLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(MealsLoadedState(meals: dummyMeals));
  }
}
