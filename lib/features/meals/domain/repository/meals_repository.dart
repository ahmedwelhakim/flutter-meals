import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';

abstract class MealsRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<MealEntity>> getMeals();
}
