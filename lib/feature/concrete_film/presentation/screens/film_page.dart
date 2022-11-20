// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_for_films/core/components/my_app_bar.dart';
import 'package:search_for_films/feature/concrete_film/presentation/cubit/film_cubit/film_cubit.dart';
import 'package:search_for_films/feature/concrete_film/presentation/widgets/film.dart';

import '../../../favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';
import '../../../favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_state.dart';
import '../../../../core/components/texts/body_text.dart';
import '../../../../core/usecases/usecases.dart';
import '../cubit/film_cubit/film_state.dart';
import '../../../searching_films/presentation/cubit/list_of_films_cubit/list_of_films_state.dart';

class FilmPage extends StatelessWidget {
  final String filmName;
  final String year;
  final int indexOfFilm;
  final ListOfLoadedFilmsState listOfLoadedFilmsState;
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  final FilmCubit filmCubit;
  const FilmPage({
    Key? key,
    required this.filmName,
    required this.year,
    required this.indexOfFilm,
    required this.listOfLoadedFilmsState,
    required this.favoriteFilmsHydratedCubit,
    required this.filmCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final concreteFilm =
        listOfLoadedFilmsState.listOfSearchResultsEntity.searchResults;
    return BlocBuilder<FavoriteFilmsHydratedCubit, FavoritesFilmsState>(
        bloc: favoriteFilmsHydratedCubit,
        builder: (context, state) {
          return Scaffold(
              appBar: MyAppBar(
                favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit,
                favoriteFilm: concreteFilm[indexOfFilm],
              ),
              backgroundColor: const Color.fromARGB(255, 33, 35, 43),
              body: BlocBuilder<FilmCubit, FilmState>(
                bloc: filmCubit,
                builder: (context, state) {
                  if (state is LoaidingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FilmLoadedState) {
                    return Film(state: state, filmCubit: filmCubit);
                  } else if (state is ErrorState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BodyText(state.error),
                          ElevatedButton(
                              onPressed: () {
                                filmCubit.loadFilm(
                                    AboutFilm(filmName: filmName, year: year));
                              },
                              child: const BodyText(
                                "Try again",
                                fontSize: 16,
                              ))
                        ],
                      ),
                    );
                  }
                  return const Center(child: BodyText("NoFilm"));
                },
              ));
        });
  }
}
