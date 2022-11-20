// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:search_for_films/feature/searching_films/domain/entities/search_result%20_entity.dart';

import '../../../feature/favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';

class ButtonForAddToFavorites extends StatelessWidget {
  final SearchResultEntity favoriteFilm;
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  const ButtonForAddToFavorites({
    Key? key,
    required this.favoriteFilm,
    required this.favoriteFilmsHydratedCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          favoriteFilmsHydratedCubit.toggleFavorite(favoriteFilm);
        },
        icon: favoriteFilmsHydratedCubit.isFavoriteFilm(film: favoriteFilm)
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(Icons.favorite_border_outlined));
  }
}
