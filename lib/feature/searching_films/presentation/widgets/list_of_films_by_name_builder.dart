// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:search_for_films/core/usecases/usecases.dart';
import 'package:search_for_films/feature/concrete_film/presentation/cubit/film_cubit/film_cubit.dart';
import 'package:search_for_films/feature/concrete_film/presentation/screens/film_page.dart';

import '../../../../core/components/texts/body_text.dart';
import '../../../../core/functions/size_conging.dart';
import '../../../favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';
import '../cubit/list_of_films_cubit/list_of_films_state.dart';

class ListOfFilms extends StatelessWidget {
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  final FilmCubit filmCubit;
  final ListOfLoadedFilmsState listOfLoadedFilmsState;
  const ListOfFilms({
    Key? key,
    required this.favoriteFilmsHydratedCubit,
    required this.filmCubit,
    required this.listOfLoadedFilmsState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        itemCount: listOfLoadedFilmsState
            .listOfSearchResultsEntity.searchResults.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FilmPage(
                        year: listOfLoadedFilmsState.listOfSearchResultsEntity
                            .searchResults[index].year,
                        filmName: listOfLoadedFilmsState
                            .listOfSearchResultsEntity
                            .searchResults[index]
                            .title,
                        listOfLoadedFilmsState: listOfLoadedFilmsState,
                        indexOfFilm: index,
                        filmCubit: filmCubit,
                        favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit,
                      )));
              filmCubit.loadFilm(AboutFilm(
                filmName: listOfLoadedFilmsState
                    .listOfSearchResultsEntity.searchResults[index].title,
                year: listOfLoadedFilmsState
                    .listOfSearchResultsEntity.searchResults[index].year,
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
                        child: Image.network(listOfLoadedFilmsState
                            .listOfSearchResultsEntity
                            .searchResults[index]
                            .poster)),
                    SizedBox(
                      width: SizeConfig(context, 15)(),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BodyText(
                            listOfLoadedFilmsState.listOfSearchResultsEntity
                                .searchResults[index].title,
                            fontSize: 17,
                            overflow: TextOverflow.clip,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: SizeConfig(context, 5)(),
                          ),
                          BodyText(
                            listOfLoadedFilmsState.listOfSearchResultsEntity
                                .searchResults[index].year,
                            fontSize: 17,
                            overflow: TextOverflow.clip,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: SizeConfig(context, 5)(),
                          ),
                          BodyText(
                            listOfLoadedFilmsState.listOfSearchResultsEntity
                                .searchResults[index].type,
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
  }
}
