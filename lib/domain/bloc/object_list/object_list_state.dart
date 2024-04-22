part of 'object_list_bloc.dart';

sealed class ObjectListState {}

final class ObjectListInitial extends ObjectListState {}

final class ObjectListLoading extends ObjectListState {}

final class ObjectListLoaded extends ObjectListState {
  List<ObjectModel> objectList;

  ObjectListLoaded({required this.objectList});
}

final class SearchObjectListLoaded extends ObjectListState {
  List<ObjectModel> searchObjectList;

  SearchObjectListLoaded({this.searchObjectList = const []});
}

final class ObjectListException extends ObjectListState {
  Object exception;

  ObjectListException({required this.exception});
}
