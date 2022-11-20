// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:search_for_films/feature/searching_films/data/model/list_of_search_results_model.dart';
import 'package:search_for_films/feature/searching_films/data/sources/searching_films_data_source.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/error/exseptions.dart';

@LazySingleton(as: SearchingRemoteDataSource)
class SearchingRemoteDataSourceImpl implements SearchingRemoteDataSource {
  final MainApi mainApi;
  SearchingRemoteDataSourceImpl({
    required this.mainApi,
  });
  @override
  Future<ListOfSearchResultsModel> getListOfFilmsByName(String filmName) async {
    final response = await mainApi.client.get(
      Uri.parse(
          "http://www.omdbapi.com/?s=$filmName&apikey=${SearchingRemoteDataSource.apiKey}&plot=full"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final listOfFilms = json.decode(response.body);
      return ListOfSearchResultsModel.fromJson(listOfFilms);
    } else {
      throw ServerException();
    }
  }
}
