// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_search_results_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfSearchResultsModel _$ListOfSearchResultsModelFromJson(
        Map<String, dynamic> json) =>
    ListOfSearchResultsModel(
      searchResults: (json['Search'] as List<dynamic>)
          .map((e) => SearchResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListOfSearchResultsModelToJson(
        ListOfSearchResultsModel instance) =>
    <String, dynamic>{
      'Search': instance.searchResults,
    };
