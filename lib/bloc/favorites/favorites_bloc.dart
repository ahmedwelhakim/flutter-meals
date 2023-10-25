import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/bloc/favorites/favorites_events.dart';
import 'package:meals_app/bloc/favorites/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial());
}
