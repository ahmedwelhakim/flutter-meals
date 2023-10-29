import 'package:get_it/get_it.dart';
import 'package:meals_app/features/meals/data/repository/meals_repository_impl.dart';
import 'package:meals_app/features/meals/domain/repository/meals_repository.dart';
import 'package:meals_app/features/meals/domain/usecases/meals_usecases.dart';
import 'package:meals_app/features/meals/presentation/bloc/meals/meals_cubit.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(
    () => MealsCubit(mealsUseCases: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => MealsUseCases(mealsRepository: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<MealsRepository>(
    () => MealsRepositoryImpl(),
  );
}
