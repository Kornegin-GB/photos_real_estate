part of 'object_list_bloc.dart';

sealed class ObjectListEvent {}

final class LoadObjectList extends ObjectListEvent {}

final class SearchObjectList extends ObjectListEvent {
  final String searchString;

  SearchObjectList(this.searchString);
}
