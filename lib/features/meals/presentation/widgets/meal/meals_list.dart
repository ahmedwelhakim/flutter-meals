import 'package:flutter/material.dart';
import 'package:meals_app/config/routes/routes.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/presentation/widgets/meal/meal_item.dart';

class MealsList extends StatelessWidget {
  final String? title;

  final List<MealEntity> meals;
  const MealsList({super.key, this.title, required this.meals});

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No Data Available'),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            navigateToMeal(context, meal);
          },
        ),
        itemCount: meals.length,
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }

  navigateToMeal(BuildContext context, MealEntity meal) {
    Navigator.of(context).pushNamed(Routes.mealsDetail, arguments: meal);
  }
}
