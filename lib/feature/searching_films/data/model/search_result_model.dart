// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/search_result _entity.dart';

part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultModel extends SearchResultEntity {
  const SearchResultModel(
      {required super.title,
      required super.year,
      required super.poster,
      required super.type});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);
}
