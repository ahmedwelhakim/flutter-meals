import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_bloc.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';
import 'package:meals_app/features/meals/presentation/widgets/meal/meals_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) {
      final state = context.watch<MealsBloc>().state;
      if (state is MealsInitialState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is MealsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is MealsFavoritesState) {
        final List<MealEntity> meals = state.favorites;
        return MealsList(
          meals: meals,
        );
      }
      return const Center(
        child: Text('No Data Available'),
      );
    });
  }
}
