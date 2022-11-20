import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:search_for_films/feature/searching_films/domain/entities/search_result%20_entity.dart';

import 'favorite_films_state.dart';

class FavoriteFilmsHydratedCubit extends HydratedCubit<FavoritesFilmsState> {
  FavoriteFilmsHydratedCubit() : super(const FavoritesFilmsState());

  void addToFavoriteFilms(SearchResultEntity favoriteFilm) {
    final favorites = List<SearchResultEntity>.from(state.listOfFavoritFilms)
      ..add(favoriteFilm);
    emit(state.copyWith(listOfFavoritFilms: favorites));
  }

  void deleteFilmFromFavorites({required SearchResultEntity film}) {
    final favorites = state.listOfFavoritFilms;
    favorites.removeWhere((element) => element == film);
    emit(state.copyWith(listOfFavoritFilms: favorites));
  }

  void toggleFavorite(SearchResultEntity film) {
    if (isFavoriteFilm(film: film)) {
      deleteFilmFromFavorites(film: film);
    } else {
      addToFavoriteFilms(film);
    }
  }

  bool isFavoriteFilm({required SearchResultEntity film}) {
    if (state.listOfFavoritFilms.contains(film)) {
      return true;
    }

    return false;
  }

  @override
  FavoritesFilmsState? fromJson(Map<String, dynamic> json) =>
      FavoritesFilmsState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(FavoritesFilmsState state) => state.toMap();

  void deleteAllFilmsFromFavorites() {
    final List<SearchResultEntity> list = [];
    emit(state.copyWith(listOfFavoritFilms: list));
  }
}
