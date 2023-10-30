import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/domain/usecases/meals_usecases.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsUseCases mealsUseCases;
  MealsCubit({
    required this.mealsUseCases,
  }) : super(const MealsState(
          categories: [],
          categoriesStatus: CategoriesStatus.initial,
          meals: [],
          mealStatus: MealsStatus.initial,
          favorites: [],
        ));

  loadCategories() {
    emit(state.copyWith(categoriesStatus: CategoriesStatus.loading));
    mealsUseCases.getCategories().then((value) {
      emit(state.copyWith(
        categoriesStatus: CategoriesStatus.loaded,
        categories: value,
      ));
    });
  }

  loadMeals() {
    emit(state.copyWith(mealStatus: MealsStatus.loading));
    mealsUseCases.getMeals().then((value) {
      emit(state.copyWith(
        mealStatus: MealsStatus.loaded,
        meals: value,
      ));
    });
  }

  toggleFavorite(MealEntity meal) {
    final favorites = mealsUseCases.toggleFavorite(
      favorites: state.favorites ?? [],
      meal: meal,
    );
    emit(state.copyWith(favorites: favorites));
  }
}
