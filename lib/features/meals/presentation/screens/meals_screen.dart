import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_cubit.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';
import 'package:meals_app/features/meals/presentation/widgets/meal/meals_list.dart';

class MealsScreen extends StatefulWidget {
  final CategoryEntity? category;
  const MealsScreen({super.key, this.category});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MealsCubit>().loadMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) {
      final state = context.watch<MealsCubit>().state;
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
      if (state is MealsLoadedSuccessfulState) {
        List<MealEntity> meals = state.meals ?? [];
        if (widget.category != null) {
          meals = meals
              .where((element) =>
                  element.categories.contains(widget.category?.title))
              .toList();
        }
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
