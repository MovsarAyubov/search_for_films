// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/model/search_result_model.dart';

class ListOfSearchResultsEntity extends Equatable {
  @JsonKey(name: "Search")
  final List<SearchResultModel> searchResults;
  const ListOfSearchResultsEntity({
    required this.searchResults,
  });
  @override
  List<Object?> get props => [searchResults];
}

class SearchResultEntity extends Equatable {
  @JsonKey(name: "Title")
  final String title;
  @JsonKey(name: "Year")
  final String year;
  @JsonKey(name: "Poster")
  final String poster;
  @JsonKey(name: "Type")
  final String type;
  const SearchResultEntity({
    required this.title,
    required this.year,
    required this.poster,
    required this.type,
  });
  @override
  List<Object> get props => [title, year, poster, type];

  SearchResultEntity copyWith({
    String? title,
    String? year,
    String? poster,
    String? type,
  }) {
    return SearchResultEntity(
      title: title ?? this.title,
      year: year ?? this.year,
      poster: poster ?? this.poster,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'year': year,
      'poster': poster,
      'type': type,
    };
  }

  factory SearchResultEntity.fromMap(Map<String, dynamic> map) {
    return SearchResultEntity(
      title: map['title'] as String,
      year: map['year'] as String,
      poster: map['poster'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResultEntity.fromJson(String source) =>
      SearchResultEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
