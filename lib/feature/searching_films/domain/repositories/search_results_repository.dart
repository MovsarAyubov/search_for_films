import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/search_result _entity.dart';

abstract class SearchResultsRepository {
  Future<Either<Failure, ListOfSearchResultsEntity>> getListOfFilmsByName(
      String filmName);
}
