// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:search_for_films/core/error/failure.dart';
import 'package:search_for_films/core/usecases/usecases.dart';
import 'package:search_for_films/feature/searching_films/domain/entities/search_result%20_entity.dart';
import 'package:search_for_films/feature/searching_films/domain/repositories/search_results_repository.dart';

@Singleton()
class GetListOfFilms implements UseCase<ListOfSearchResultsEntity, FilmName> {
  final SearchResultsRepository searchResultsRepository;
  const GetListOfFilms({
    required this.searchResultsRepository,
  });
  @override
  Future<Either<Failure, ListOfSearchResultsEntity>> call(
      FilmName filmName) async {
    return await searchResultsRepository
        .getListOfFilmsByName(filmName.filmName);
  }
}
