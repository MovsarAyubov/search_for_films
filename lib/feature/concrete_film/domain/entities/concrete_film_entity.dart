// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ConcreteFilmEntity extends Equatable {
  final String title;
  final String year;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String imbdRating;
  const ConcreteFilmEntity({
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
  });

  @override
  List<Object?> get props => [
        title,
        year,
        released,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        awards,
        imbdRating,
      ];
}
