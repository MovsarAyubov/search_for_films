// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:search_for_films/core/error/failure.dart';
import 'package:search_for_films/feature/concrete_film/domain/repositories/film_repository.dart';

import '../../domain/entities/concrete_film_entity.dart';
import '../sources/film_remote_data_sources.dart';

@LazySingleton(as: FilmRepository)
class FilmRepositoryImpl implements FilmRepository {
  final FilmRemoteDataSource filmRemoteDataSourceImpl;
  const FilmRepositoryImpl({
    required this.filmRemoteDataSourceImpl,
  });
  @override
  Future<Either<Failure, ConcreteFilmEntity>> getFilm(
      {required String filmName, required String year}) async {
    try {
      final remoteFilm = await filmRemoteDataSourceImpl.getFilm(
          filmName: filmName, year: year);
      return Right(remoteFilm);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
