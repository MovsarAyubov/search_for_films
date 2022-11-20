// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:search_for_films/core/error/failure.dart';
import 'package:search_for_films/core/usecases/usecases.dart';
import 'package:search_for_films/feature/concrete_film/domain/repositories/film_repository.dart';

import '../entities/concrete_film_entity.dart';

@Singleton()
class GetFilm implements UseCase<ConcreteFilmEntity, AboutFilm> {
  final FilmRepository filmRepository;
  const GetFilm({
    required this.filmRepository,
  });
  @override
  Future<Either<Failure, ConcreteFilmEntity>> call(AboutFilm info) async {
    return await filmRepository.getFilm(
        filmName: info.filmName, year: info.year);
  }
}
