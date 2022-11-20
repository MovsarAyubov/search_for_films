import '../model/list_of_search_results_model.dart';

abstract class SearchingRemoteDataSource {
  static const String apiKey = "ce79dcdd";
  Future<ListOfSearchResultsModel> getListOfFilmsByName(String filmName);
}
