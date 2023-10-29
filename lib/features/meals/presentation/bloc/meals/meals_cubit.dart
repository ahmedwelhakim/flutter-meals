import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/domain/usecases/meals_usecases.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsUseCases mealsUseCases;
  MealsCubit({
    required this.mealsUseCases,
  }) : super(const MealsInitialState());

  loadCategories() {
    emit(MealsCategoriesLoadingState(
      categories: state.categories,
      meals: state.meals,
      favorites: state.favorites,
    ));
    mealsUseCases.getCategories().then((value) {
      emit(MealsCategoriesLoadedSuccessfullState(
        categories: value,
        meals: state.meals,
        favorites: state.favorites,
      ));
    });
  }

  loadMeals() {
    emit(MealsLoadingState(
      categories: state.categories,
      meals: state.meals,
      favorites: state.favorites,
    ));
    mealsUseCases.getMeals().then((value) {
      emit(MealsLoadedSuccessfulState(
        meals: value,
        favorites: state.favorites,
        categories: state.categories,
      ));
    });
  }

  toggleFavorite(MealEntity meal) {
    final favorites = mealsUseCases.toggleFavorite(
      favorites: state.favorites ?? [],
      meal: meal,
    );
    emit(MealsFavoritesLoadedState(
      favorites: favorites,
      categories: state.categories,
      meals: state.meals,
    ));
  }
}
