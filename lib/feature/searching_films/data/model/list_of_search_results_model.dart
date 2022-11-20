// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:search_for_films/feature/searching_films/data/model/search_result_model.dart';
import 'package:search_for_films/feature/searching_films/domain/entities/search_result%20_entity.dart';

part 'list_of_search_results_model.g.dart';

@JsonSerializable()
class ListOfSearchResultsModel extends ListOfSearchResultsEntity {
  @override
  @JsonKey(name: "Search")
  // ignore: overridden_fields
  final List<SearchResultModel> searchResults;
  const ListOfSearchResultsModel({
    required this.searchResults,
  }) : super(searchResults: searchResults);

  factory ListOfSearchResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ListOfSearchResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfSearchResultsModelToJson(this);
}
