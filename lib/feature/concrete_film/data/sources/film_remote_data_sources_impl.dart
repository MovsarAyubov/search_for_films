import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/error/exseptions.dart';
import '../models/film_model.dart';
import 'film_remote_data_sources.dart';

@LazySingleton(as: FilmRemoteDataSource)
class FilmRemoteDataSourceImpl implements FilmRemoteDataSource {
  final MainApi mainApi;
  FilmRemoteDataSourceImpl({
    required this.mainApi,
  });
  @override
  Future<FilmModel> getFilm(
      {required String filmName, required String year}) async {
    final response = await mainApi.client.get(
      Uri.parse(
          "http://www.omdbapi.com/?t=$filmName&y=$year&apikey=${FilmRemoteDataSource.apiKey}&plot=full"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final joke = json.decode(response.body);
      return FilmModel.fromJson(joke);
    } else {
      throw ServerException();
    }
  }
}
