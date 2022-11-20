// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class AboutFilm extends Equatable {
  final String filmName;
  final String year;
  const AboutFilm({
    required this.filmName,
    required this.year,
  });

  @override
  List<Object?> get props => [filmName];
}

class FilmName extends Equatable {
  final String filmName;
  const FilmName({
    required this.filmName,
  });
  @override
  List<Object?> get props => [filmName];
}
