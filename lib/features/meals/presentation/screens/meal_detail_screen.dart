import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meals/domain/entities/meal_entity.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_bloc.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_events.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_state.dart';

class MealDetailScreen extends StatelessWidget {
  final MealEntity meal;
  const MealDetailScreen({super.key, required this.meal});
  @override
  Widget build(BuildContext context) {
    return BlocListener<MealsBloc, MealsState>(
      listener: (context, state) {
        if (state is MealsFavoritesState) {
          if (state.favorites.contains(meal)) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Meal Added to Favorites'),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Meal Removed from Favorites'),
            ));
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            Builder(builder: (ctx) {
              final state = context.watch<MealsBloc>().state;
              if (state is MealsFavoritesState) {
                final isFavorite = state.favorites.contains(meal);
                return IconButton(
                  onPressed: () {
                    context.read().add(ToggleFavoriteMealEvent(meal));
                  },
                  icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                );
              }
              return IconButton(
                onPressed: () {
                  context.read().add(ToggleFavoriteMealEvent(meal));
                },
                icon: const Icon(Icons.star_border),
              );
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final setp in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    setp,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
