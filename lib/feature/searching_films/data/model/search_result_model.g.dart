// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel(
      title: json['Title'] as String,
      year: json['Year'] as String,
      poster: json['Poster'] as String,
      type: json['Type'] as String,
    );

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Poster': instance.poster,
      'Type': instance.type,
    };
