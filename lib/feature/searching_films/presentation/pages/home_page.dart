import 'package:flutter/material.dart';

import '../../../../core/components/simple_app_bar.dart';
import '../../../../setup.dart';
import '../../../favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';
import '../../../concrete_film/presentation/cubit/film_cubit/film_cubit.dart';
import '../cubit/list_of_films_cubit/list_of_films_cubit.dart';
import '../widgets/form_for_entering.dart';
import '../../../favorite_films/presentation/screens/favorites_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filmCubit = getIt<FilmCubit>();
  final listOfFilmsCubit = getIt<ListOfFilmsCubit>();
  final favoriteFilmsHydratedCubit = FavoriteFilmsHydratedCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 36, 46, 54),
          icon: const Icon(
            Icons.favorite,
          ),
          label: Text(AppLocalizations.of(context)!.floatingButtonText),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavoritesPage(
                    filmCubit: filmCubit,
                    favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit)));
          }),
      appBar: const SimpleAppBar(),
      backgroundColor: const Color.fromARGB(255, 33, 35, 43),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: FormForEntering(
            favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit,
            filmCubit: filmCubit,
            listOfFilmsCubit: listOfFilmsCubit,
          )),
    );
  }
}
