// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:search_for_films/core/usecases/usecases.dart';

import '../../../domain/usecases/get_film.dart';
import 'film_state.dart';

@Injectable()
class FilmCubit extends Cubit<FilmState> {
  final GetFilm getFilm;
  FilmCubit(
    this.getFilm,
  ) : super(NoFilmState());

  loadFilm(AboutFilm info) async {
    emit(LoaidingState());
    final response = await getFilm(info);
    response.fold(
      (error) => emit(ErrorState(error: "No enternet connection")),
      (film) => emit(FilmLoadedState(filmEntity: film)),
    );
  }
}
