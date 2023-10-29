import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_cubit.dart';
import 'package:meals_app/features/meals/presentation/screens/categories_screen.dart';
import 'package:meals_app/features/meals/presentation/screens/favorites_screen.dart';
import 'package:meals_app/features/meals/presentation/screens/meal_detail_screen.dart';
import 'package:meals_app/features/meals/presentation/screens/meals_screen.dart';
import 'package:meals_app/features/meals/presentation/screens/tabs_screen.dart';
import 'package:meals_app/service_locator.dart';

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
            builder: (_) => BlocProvider.value(
              value: serviceLocator<MealsCubit>(),
              child: const TabsScreen(
                title: 'Categories',
                activePage: CategoriesSceen(),
              ),
            ),
          );
        }
      case mealsList:
        {
          final CategoryEntity category = settings.arguments as CategoryEntity;

          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: serviceLocator<MealsCubit>(),
              child: TabsScreen(
                title: 'Meals',
                activePage: MealsScreen(category: category),
              ),
            ),
          );
        }
      case mealsDetail:
        {
          final meal = settings.arguments as MealEntity;
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: serviceLocator<MealsCubit>(),
              child: TabsScreen(
                activePage: MealDetailScreen(meal: meal),
              ),
            ),
          );
        }
      case favorites:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<MealsCubit>.value(
              value: serviceLocator<MealsCubit>(),
              child: const TabsScreen(
                activePage: FavoritesScreen(),
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
