import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/concrete_film_entity.dart';

abstract class FilmRepository {
  Future<Either<Failure, ConcreteFilmEntity>> getFilm(
      {required String filmName, required String year});
}
