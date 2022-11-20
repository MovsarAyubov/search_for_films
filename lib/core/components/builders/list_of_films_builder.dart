// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:search_for_films/feature/favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';
import 'package:search_for_films/feature/concrete_film/presentation/cubit/film_cubit/film_cubit.dart';

import '../../../feature/searching_films/presentation/cubit/list_of_films_cubit/list_of_films_state.dart';

class ListOfFilmsBuilder extends StatelessWidget {
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  final FilmCubit filmCubit;
  final ListOfLoadedFilmsState state;
  const ListOfFilmsBuilder({
    Key? key,
    required this.favoriteFilmsHydratedCubit,
    required this.filmCubit,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListOfFilmsBuilder(
        favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit,
        filmCubit: filmCubit,
        state: state);
  }
}
