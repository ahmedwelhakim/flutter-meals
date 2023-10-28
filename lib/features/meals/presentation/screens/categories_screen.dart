import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/config/routes/routes.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_bloc.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_events.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';
import 'package:meals_app/features/meals/presentation/widgets/category/category_grid_item.dart';

class CategoriesSceen extends StatefulWidget {
  const CategoriesSceen({super.key});

  @override
  State<CategoriesSceen> createState() => _CategoriesSceenState();
}

class _CategoriesSceenState extends State<CategoriesSceen> {
  @override
  void initState() {
    super.initState();
    context.read<MealsBloc>().add(LoadCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MealsBloc>().state;

    if (state is MealsCategoriesLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is MealsCategoriesLoadedSuccessfullState) {
      final availableCategories = state.categories;
      return GridView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: (category) {
                  selectCategory(context, category);
                }),
        ],
      );
    }
    return const Center(
      child: Text("No Available Data"),
    );
  }

  void selectCategory(BuildContext context, CategoryEntity category) {
    Navigator.of(context).pushNamed(
      Routes.mealsList,
      arguments: category,
    );
  }
}