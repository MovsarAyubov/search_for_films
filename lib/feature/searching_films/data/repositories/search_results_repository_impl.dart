// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:search_for_films/core/error/failure.dart';
import 'package:search_for_films/feature/searching_films/data/sources/searching_films_data_source.dart';
import 'package:search_for_films/feature/searching_films/domain/entities/search_result%20_entity.dart';
import 'package:search_for_films/feature/searching_films/domain/repositories/search_results_repository.dart';

@LazySingleton(as: SearchResultsRepository)
class SearchResultsRepositoryImpl implements SearchResultsRepository {
  final SearchingRemoteDataSource searchingRemoteDataSource;
  SearchResultsRepositoryImpl({
    required this.searchingRemoteDataSource,
  });
  @override
  Future<Either<Failure, ListOfSearchResultsEntity>> getListOfFilmsByName(
      String filmName) async {
    try {
      final remoteListOfFilms =
          await searchingRemoteDataSource.getListOfFilmsByName(filmName);
      return Right(remoteListOfFilms);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
