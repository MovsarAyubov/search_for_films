import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/concrete_film_entity.dart';

part 'film_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FilmModel extends ConcreteFilmEntity {
  @override
  @JsonKey(name: "Title")
  // ignore: overridden_fields
  final String title;

  @override
  @JsonKey(name: "Year")
  // ignore: overridden_fields
  final String year;

  @override
  @JsonKey(name: "Released")
  // ignore: overridden_fields
  final String released;

  @override
  @JsonKey(name: "Runtime")
  // ignore: overridden_fields
  final String runtime;
  @override
  @JsonKey(name: "Genre")
  // ignore: overridden_fields
  final String genre;
  @override
  @JsonKey(name: "Director")
  // ignore: overridden_fields
  final String director;
  @override
  @JsonKey(name: "Writer")
  // ignore: overridden_fields
  final String writer;
  @override
  @JsonKey(name: "Actors")
  // ignore: overridden_fields
  final String actors;
  @override
  @JsonKey(name: "Plot")
  // ignore: overridden_fields
  final String plot;
  @override
  @JsonKey(name: "Language")
  // ignore: overridden_fields
  final String language;
  @override
  @JsonKey(name: "Country")
  // ignore: overridden_fields
  final String country;

  @override
  @JsonKey(name: "Awards")
  // ignore: overridden_fields
  final String awards;

  @override
  @JsonKey(name: "imdbRating")
  // ignore: overridden_fields
  final String imbdRating;

  @override
  @JsonKey(name: "Poster")
  // ignore: overridden_fields
  final String poster;

  const FilmModel({
    required this.title,
    required this.year,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.imbdRating,
  }) : super(
          title: title,
          year: year,
          released: released,
          runtime: runtime,
          genre: genre,
          director: director,
          writer: writer,
          actors: actors,
          plot: plot,
          language: language,
          country: country,
          awards: awards,
          poster: poster,
          imbdRating: imbdRating,
        );

  factory FilmModel.fromJson(Map<String, dynamic> json) =>
      _$FilmModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmModelToJson(this);
}




      // required String poster,
      // {required String title,
      // : super(
      // required int year,
      //       year: year,
      // required String released,
      //       runtime: runtime,
      // required int runtime,
      //       director: director,
      // required String genre,
      //       actors: actors,
      // required String director,
      //       language: language,
      // required String writer,
      //       awards: awards,
      // required String actors,
      //       ratings: ratings);
      // required String language,
      // required String awards,
      // required List<RatingsModel> ratings})
      //       title: title,
      //       released: released,
      //       genre: genre,
      //       writer: writer,
      //       plot: plot,
      //       country: country,
      //       poster: poster,
