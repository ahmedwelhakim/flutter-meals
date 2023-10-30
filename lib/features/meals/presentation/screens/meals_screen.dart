import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_cubit.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';
import 'package:meals_app/features/meals/presentation/widgets/meal/meals_list.dart';

class MealsScreen extends StatelessWidget {
  final CategoryEntity category;
  const MealsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) {
      final state = context.watch<MealsCubit>().state;
      if (state.mealStatus == MealsStatus.initial) {
        context.read<MealsCubit>().loadMeals();
      }
      if (state.mealStatus == MealsStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state.mealStatus == MealsStatus.error) {
        return const Center(
          child: Text('Something went wrong'),
        );
      }

      List<MealEntity> meals = state.meals ?? [];

      meals = meals
          .where((element) => element.categories.contains(category.id))
          .toList();

      return MealsList(
        meals: meals,
      );
    });
  }
}
