import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_real_estate/data/models/object_model.dart';
import 'package:photos_real_estate/data/repositories/interface_object_repository.dart';

part 'object_list_event.dart';
part 'object_list_state.dart';

class ObjectListBloc extends Bloc<ObjectListEvent, ObjectListState> {
  ObjectListBloc(this._objectRepository) : super(ObjectListInitial()) {
    on<LoadObjectList>(_loadObjectList);
    on<SearchObjectList>(_loadSearchObjectList);
  }

  final InterfaceObjectRepository _objectRepository;

  Future<void> _loadObjectList(
    LoadObjectList event,
    Emitter<ObjectListState> emit,
  ) async {
    emit(ObjectListLoading());
    final objectList = await _objectRepository.getObjectList();
    emit(ObjectListLoaded(objectList: objectList));
  }

  Future<void> _loadSearchObjectList(
    SearchObjectList event,
    Emitter<ObjectListState> emit,
  ) async {
    emit(ObjectListLoading());
    final objectList = await _objectRepository.getObjectList();
    final searchObjectList = objectList
        .where((element) => element.title
            .toLowerCase()
            .contains(event.searchString.toLowerCase()))
        .toList();
    emit(SearchObjectListLoaded(searchObjectList: searchObjectList));
  }
}
