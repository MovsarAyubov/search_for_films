// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/search_result _entity.dart';

abstract class ListOfFilmsState extends Equatable {}

class ListOfLoadedFilmsState extends ListOfFilmsState {
  final ListOfSearchResultsEntity listOfSearchResultsEntity;
  ListOfLoadedFilmsState({
    required this.listOfSearchResultsEntity,
  });
  @override
  List<Object?> get props => [listOfSearchResultsEntity];
}

class NoFilmsState extends ListOfFilmsState {
  NoFilmsState();
  @override
  List<Object?> get props => [];
}

class LoaidingFilmsState extends ListOfFilmsState {
  LoaidingFilmsState();
  @override
  List<Object?> get props => [];
}

class ErrorFilmsState extends ListOfFilmsState {
  final String error;
  ErrorFilmsState({required this.error});
  @override
  List<Object?> get props => [error];
}
