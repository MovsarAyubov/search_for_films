// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_for_films/core/components/simple_app_bar.dart';

import '../../../../core/components/texts/body_text.dart';
import '../../../favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';
import '../../../concrete_film/presentation/cubit/film_cubit/film_cubit.dart';
import '../cubit/list_of_films_cubit/list_of_films_cubit.dart';
import '../cubit/list_of_films_cubit/list_of_films_state.dart';
import '../widgets/list_of_films_by_name_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListOfFilmsPage extends StatelessWidget {
  final String filmName;
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  final FilmCubit filmCubit;
  final ListOfFilmsCubit listOfFilmsCubit;
  const ListOfFilmsPage({
    Key? key,
    required this.filmName,
    required this.favoriteFilmsHydratedCubit,
    required this.filmCubit,
    required this.listOfFilmsCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 35, 43),
        appBar: const SimpleAppBar(),
        body: BlocBuilder<ListOfFilmsCubit, ListOfFilmsState>(
          bloc: listOfFilmsCubit,
          builder: (context, state) {
            if (state is LoaidingFilmsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListOfLoadedFilmsState) {
              return ListOfFilms(
                favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit,
                filmCubit: filmCubit,
                listOfLoadedFilmsState: state,
              );
            } else if (state is ErrorFilmsState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BodyText(state.error),
                    ElevatedButton(
                        onPressed: () {
                          listOfFilmsCubit.loadListOfFilms(
                              filmName: filmName, context: context);
                        },
                        child: BodyText(
                          AppLocalizations.of(context)!.errorButtonText,
                          fontSize: 16,
                        ))
                  ],
                ),
              );
            } else {
              return const Center(
                  child: BodyText(
                "No Films",
                fontSize: 20,
              ));
            }
          },
        ));
  }
}
