// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmModel _$FilmModelFromJson(Map<String, dynamic> json) => FilmModel(
      title: json['Title'] as String,
      year: json['Year'] as String,
      released: json['Released'] as String,
      runtime: json['Runtime'] as String,
      genre: json['Genre'] as String,
      director: json['Director'] as String,
      writer: json['Writer'] as String,
      actors: json['Actors'] as String,
      plot: json['Plot'] as String,
      language: json['Language'] as String,
      country: json['Country'] as String,
      awards: json['Awards'] as String,
      poster: json['Poster'] as String,
      imbdRating: json['imdbRating'] as String,
    );

Map<String, dynamic> _$FilmModelToJson(FilmModel instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Awards': instance.awards,
      'imdbRating': instance.imbdRating,
      'Poster': instance.poster,
    };
