import 'package:search_for_films/feature/concrete_film/data/models/film_model.dart';

abstract class FilmRemoteDataSource {
  static const String apiKey = "ce79dcdd";
  Future<FilmModel> getFilm({required String filmName, required String year});
}
