// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/main_api.dart' as _i3;
import 'feature/concrete_film/data/repositories/film_repository_impl.dart'
    as _i9;
import 'feature/searching_films/data/repositories/search_results_repository_impl.dart'
    as _i12;
import 'feature/concrete_film/data/sources/film_remote_data_sources.dart'
    as _i6;
import 'feature/concrete_film/data/sources/film_remote_data_sources_impl.dart'
    as _i7;
import 'feature/searching_films/data/sources/searching_films_data_source.dart'
    as _i4;
import 'feature/searching_films/data/sources/searching_films_data_source_impl.dart'
    as _i5;
import 'feature/concrete_film/domain/repositories/film_repository.dart' as _i8;
import 'feature/searching_films/domain/repositories/search_results_repository.dart'
    as _i11;
import 'feature/concrete_film/domain/usecases/get_film.dart' as _i10;
import 'feature/searching_films/domain/usecases/get_list_of_films.dart' as _i14;
import 'feature/concrete_film/presentation/cubit/film_cubit/film_cubit.dart'
    as _i13;
import 'feature/searching_films/presentation/cubit/list_of_films_cubit/list_of_films_cubit.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.MainApi>(() => _i3.MainApi());
  gh.lazySingleton<_i4.SearchingRemoteDataSource>(
      () => _i5.SearchingRemoteDataSourceImpl(mainApi: get<_i3.MainApi>()));
  gh.lazySingleton<_i6.FilmRemoteDataSource>(
      () => _i7.FilmRemoteDataSourceImpl(mainApi: get<_i3.MainApi>()));
  gh.lazySingleton<_i8.FilmRepository>(() => _i9.FilmRepositoryImpl(
      filmRemoteDataSourceImpl: get<_i6.FilmRemoteDataSource>()));
  gh.singleton<_i10.GetFilm>(
      _i10.GetFilm(filmRepository: get<_i8.FilmRepository>()));
  gh.lazySingleton<_i11.SearchResultsRepository>(() =>
      _i12.SearchResultsRepositoryImpl(
          searchingRemoteDataSource: get<_i4.SearchingRemoteDataSource>()));
  gh.factory<_i13.FilmCubit>(() => _i13.FilmCubit(get<_i10.GetFilm>()));
  gh.singleton<_i14.GetListOfFilms>(_i14.GetListOfFilms(
      searchResultsRepository: get<_i11.SearchResultsRepository>()));
  gh.factory<_i15.ListOfFilmsCubit>(
      () => _i15.ListOfFilmsCubit(get<_i14.GetListOfFilms>()));
  return get;
}
