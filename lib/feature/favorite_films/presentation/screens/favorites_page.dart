import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:search_for_films/core/components/simple_app_bar.dart';
import 'package:search_for_films/feature/concrete_film/presentation/cubit/film_cubit/film_cubit.dart';
import 'package:search_for_films/feature/concrete_favorite_film/presentation/screens/concrete_favorite_film.dart';

import '../cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';
import '../cubit/favorite_films_hydrated_cubit/favorite_films_state.dart';
import '../../../../core/components/texts/body_text.dart';
import '../../../../core/functions/size_conging.dart';
import '../../../../core/usecases/usecases.dart';

class FavoritesPage extends StatelessWidget {
  final FilmCubit filmCubit;
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  const FavoritesPage({
    Key? key,
    required this.filmCubit,
    required this.favoriteFilmsHydratedCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 36, 46, 54),
            child: const Icon(Icons.delete),
            onPressed: () {
              favoriteFilmsHydratedCubit.deleteAllFilmsFromFavorites();
            }),
        backgroundColor: const Color.fromARGB(255, 33, 35, 43),
        appBar: const SimpleAppBar(),
        body: BlocBuilder<FavoriteFilmsHydratedCubit, FavoritesFilmsState>(
          bloc: favoriteFilmsHydratedCubit,
          builder: (context, state) {
            final state = favoriteFilmsHydratedCubit.state.listOfFavoritFilms;
            return state.isEmpty
                ? const Center(child: BodyText("No films in favorites"))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ConcreteFavoriteFilm(
                                  filmName: state[index].title,
                                  year: state[index].year,
                                  indexOfFilm: index,
                                  listOfFilmsState:
                                      favoriteFilmsHydratedCubit.state,
                                  favoriteFilmsHydratedCubit:
                                      favoriteFilmsHydratedCubit,
                                  filmCubit: filmCubit)));
                          filmCubit.loadFilm(AboutFilm(
                            filmName: state[index].title,
                            year: state[index].year,
                          ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: SizeConfig(context, 140)(),
                                    width: SizeConfig(context, 100)(),
                                    child: Image.network(state[index].poster)),
                                SizedBox(
                                  width: SizeConfig(context, 15)(),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BodyText(
                                        state[index].title,
                                        fontSize: 17,
                                        overflow: TextOverflow.clip,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: SizeConfig(context, 5)(),
                                      ),
                                      BodyText(
                                        state[index].year,
                                        fontSize: 17,
                                        overflow: TextOverflow.clip,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: SizeConfig(context, 5)(),
                                      ),
                                      BodyText(
                                        state[index].type,
                                        fontSize: 17,
                                        overflow: TextOverflow.clip,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig(context, 25)(),
                            )
                          ],
                        ),
                      );
                    });
          },
        ));
  }
}
