// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:search_for_films/feature/searching_films/domain/entities/search_result%20_entity.dart';

import 'buttons/add_to_favorite_button.dart';
import '../../feature/favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SearchResultEntity favoriteFilm;
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  const MyAppBar({
    Key? key,
    required this.favoriteFilm,
    required this.favoriteFilmsHydratedCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          ButtonForAddToFavorites(
              favoriteFilm: favoriteFilm,
              favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit),
        ],
        backgroundColor: const Color.fromARGB(255, 36, 46, 54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.app_bar_name,
            ),
            const Icon(Icons.search_sharp)
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
