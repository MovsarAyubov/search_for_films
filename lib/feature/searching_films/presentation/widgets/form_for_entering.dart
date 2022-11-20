// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:search_for_films/feature/concrete_film/presentation/cubit/film_cubit/film_cubit.dart';

import '../../../favorite_films/presentation/cubit/favorite_films_hydrated_cubit/favorite_films_hydrated_cubit.dart';
import '../cubit/list_of_films_cubit/list_of_films_cubit.dart';
import '../pages/list_of_films_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormForEntering extends StatelessWidget {
  final FavoriteFilmsHydratedCubit favoriteFilmsHydratedCubit;
  final FilmCubit filmCubit;
  final ListOfFilmsCubit listOfFilmsCubit;
  FormForEntering({
    Key? key,
    required this.favoriteFilmsHydratedCubit,
    required this.filmCubit,
    required this.listOfFilmsCubit,
  }) : super(key: key);

  final TextEditingController _filmNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        onFieldSubmitted: (_) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ListOfFilmsPage(
                    filmName: _filmNameController.text,
                    favoriteFilmsHydratedCubit: favoriteFilmsHydratedCubit,
                    filmCubit: filmCubit,
                    listOfFilmsCubit: listOfFilmsCubit,
                  )));
          listOfFilmsCubit.loadListOfFilms(
              filmName: _filmNameController.text, context: context);
        },
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.textFieldHintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        controller: _filmNameController,
      ),
    );
  }
}
