import 'package:dio/dio.dart';
import 'package:photos_real_estate/data/models/object_model.dart';
import 'package:photos_real_estate/data/repositories/interface_object_repository.dart';

class GetDataObjects implements InterfaceObjectRepository {
  @override
  Future<List<ObjectModel>> getObjectList() async {
    String url = "https://json-parser.com/f5628f20/4.json";
    final response = await Dio().get(url);
    final data = response.data as Map<String, dynamic>;
    final objectList = data["payload"] as List;
    return objectList.map((e) => ObjectModel.fromJson(e)).toList();
  }
}
