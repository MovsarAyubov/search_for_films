// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:search_for_films/feature/searching_films/presentation/cubit/list_of_films_cubit/list_of_films_state.dart';

import '../../../../../core/usecases/usecases.dart';
import '../../../domain/usecases/get_list_of_films.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@Injectable()
class ListOfFilmsCubit extends Cubit<ListOfFilmsState> {
  final GetListOfFilms getListOfFilms;

  ListOfFilmsCubit(
    this.getListOfFilms,
  ) : super(NoFilmsState());

  loadListOfFilms(
      {required String filmName, required BuildContext context}) async {
    emit(LoaidingFilmsState());

    final response = await getListOfFilms(FilmName(filmName: filmName));
    response.fold(
        (error) => emit(
            ErrorFilmsState(error: AppLocalizations.of(context)!.noInternet)),
        (listOfFilms) => emit(ListOfLoadedFilmsState(
              listOfSearchResultsEntity: listOfFilms,
            )));
  }
}
