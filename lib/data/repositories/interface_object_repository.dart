import 'package:photos_real_estate/data/models/object_model.dart';

abstract class InterfaceObjectRepository {
  Future<List<ObjectModel>> getObjectList();
}
