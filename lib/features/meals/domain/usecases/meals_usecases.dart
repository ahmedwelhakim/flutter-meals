import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/domain/repository/meals_repository.dart';

class MealsUseCases {
  final MealsRepository mealsRepository;

  MealsUseCases({required this.mealsRepository});

  Future<List<CategoryEntity>> getCategories() async {
    final categories = await mealsRepository.getCategories();
    return categories;
  }

  Future<List<MealEntity>> getMeals() async {
    final meals = await mealsRepository.getMeals();
    return meals;
  }

  List<MealEntity> toggleFavorite(
      {required List<MealEntity> favorites, required MealEntity meal}) {
    if (favorites.contains(meal)) {
      return favorites.where((element) => element.id != meal.id).toList();
    }
    return [...favorites, meal];
  }
}
