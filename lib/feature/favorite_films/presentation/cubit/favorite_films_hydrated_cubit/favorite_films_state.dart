import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../searching_films/domain/entities/search_result _entity.dart';

class FavoritesFilmsState extends Equatable {
  final List<SearchResultEntity> listOfFavoritFilms;
  const FavoritesFilmsState({
    this.listOfFavoritFilms = const [],
  });

  @override
  List<Object> get props => [listOfFavoritFilms];

  FavoritesFilmsState copyWith({
    List<SearchResultEntity>? listOfFavoritFilms,
  }) {
    return FavoritesFilmsState(
      listOfFavoritFilms: listOfFavoritFilms ?? this.listOfFavoritFilms,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'listOfFavoritFilms': listOfFavoritFilms.map((x) => x.toMap()).toList()
    });

    return result;
  }

  factory FavoritesFilmsState.fromMap(Map<String, dynamic> map) {
    return FavoritesFilmsState(
      listOfFavoritFilms: List<SearchResultEntity>.from(
          map['listOfFavoritFilms']?.map((x) => SearchResultEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesFilmsState.fromJson(String source) =>
      FavoritesFilmsState.fromMap(json.decode(source));

  @override
  String toString() =>
      'FavoritesFilmsState(listOfFavoritFilms: $listOfFavoritFilms)';
}
