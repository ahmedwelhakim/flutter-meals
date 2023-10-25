import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/favorites_bloc.dart';
import 'package:meals_app/bloc/favorites_events.dart';
import 'package:meals_app/bloc/favorites_state.dart';
import 'package:meals_app/bloc/meals/meals_bloc.dart';
import 'package:meals_app/bloc/meals/meals_state.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesSceen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(meals: []);
      activePageTitle = 'Favorites';
    }
    return BlocProvider(
      create: (context) => MealsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMeals(List<Meal> meals) {
    return MealsScreen(meals: meals);
  }

  Widget buildMealsBloc() {
    return BlocBuilder<MealsBloc, MealsState>(builder: (context, state) {
      if (state is MealsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is MealsLoadedState) {
        return buildMeals(state.meals);
      }
      return const Center(
        child: Text('No Data Available'),
      );
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
