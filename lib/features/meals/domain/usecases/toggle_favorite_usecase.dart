import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';

class ToggleFavoriteUseCase {
  execute({required List<MealEntity> favorites, required MealEntity meal}) {
    if (favorites.contains(meal)) {
      return favorites.where((element) => element.id != meal.id).toList();
    }
    return [...favorites, meal];
  }
}
