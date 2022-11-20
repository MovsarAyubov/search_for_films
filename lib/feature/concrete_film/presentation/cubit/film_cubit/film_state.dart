// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/concrete_film_entity.dart';

abstract class FilmState extends Equatable {}

class NoFilmState extends FilmState {
  NoFilmState();
  @override
  List<Object?> get props => [];
}

class LoaidingState extends FilmState {
  LoaidingState();
  @override
  List<Object?> get props => [];
}

class FilmLoadedState extends FilmState {
  final ConcreteFilmEntity filmEntity;
  FilmLoadedState({
    required this.filmEntity,
  });
  @override
  List<Object?> get props => [filmEntity];
}

class ErrorState extends FilmState {
  final String error;
  ErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
