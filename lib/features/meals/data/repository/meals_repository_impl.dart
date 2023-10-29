import 'package:meals_app/features/meals/data/data_sources/categories_source.dart';
import 'package:meals_app/features/meals/data/data_sources/meals_source.dart';
import 'package:meals_app/features/meals/data/models/category_model.dart';
import 'package:meals_app/features/meals/data/models/meal_model.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/domain/repository/meals_repository.dart';

class MealsRepositoryImpl implements MealsRepository {
  @override
  Future<List<CategoryEntity>> getCategories() async {
    await Future.delayed(const Duration(seconds: 3));
    return availableCategories
        .map(
          (category) => CategoryModel(
            id: category.id,
            title: category.title,
            color: category.color,
          ).toEntity(),
        )
        .toList();
  }

  @override
  Future<List<MealEntity>> getMeals() async {
    await Future.delayed(const Duration(seconds: 3));
    return dummyMeals
        .map(
          (meal) => MealModel(
            id: meal.id,
            categories: meal.categories,
            title: meal.title,
            imageUrl: meal.imageUrl,
            ingredients: meal.ingredients,
            steps: meal.steps,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            isGlutenFree: meal.isGlutenFree,
            isLactoseFree: meal.isLactoseFree,
            isVegan: meal.isVegan,
            isVegetarian: meal.isVegetarian,
          ).toEntity(),
        )
        .toList();
  }
}
