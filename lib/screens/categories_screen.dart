import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/routes/routes.dart';
import 'package:meals_app/widgets/category/category_grid_item.dart';

class CategoriesSceen extends StatelessWidget {
  const CategoriesSceen({super.key});
  @override
  Widget build(BuildContext context) {
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

  void selectCategory(BuildContext context, Category category) {
    Navigator.of(context).pushNamed(
      Routes.mealsList,
    );
  }
}
