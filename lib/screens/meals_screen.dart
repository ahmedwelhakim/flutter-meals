import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;

  final List<Meal> meals;
  const MealsScreen({super.key, this.title, required this.meals});

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

  navigateToMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MealDetailScreen(
          meal: meal,
        ),
      ),
    );
  }
}
