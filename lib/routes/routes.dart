import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/meals/meals_bloc.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class Routes {
  static const String categories = '/';
  static const String favorites = '/favorites';
  static const String mealsList = '/mealsList';
  static const String mealsDetail = '/mealsDetail';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categories:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => MealsBloc(),
              child: const TabsScreen(
                title: 'Categories',
                activePage: CategoriesSceen(),
              ),
            ),
          );
        }
      case mealsList:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => MealsBloc(),
              child: const TabsScreen(
                title: 'Meals',
                activePage: MealsScreen(),
              ),
            ),
          );
        }
      case mealsDetail:
        {
          final meal = settings.arguments as Meal;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => MealsBloc(),
              child: TabsScreen(
                title: meal.title,
                activePage: MealDetailScreen(meal: meal),
              ),
            ),
          );
        }

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined for this name'),
            ),
          ),
        );
    }
  }
}
