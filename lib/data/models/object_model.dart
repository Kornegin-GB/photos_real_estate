import 'package:photos_real_estate/data/models/point_model.dart';

class ObjectModel {
  final String title;
  final num remainingPoints;
  final num totalPointsCount;
  final List<PointModel> points;

  ObjectModel({
    required this.title,
    required this.remainingPoints,
    required this.totalPointsCount,
    required this.points,
  });

  factory ObjectModel.fromJson(Map<String, dynamic> parsJson) {
    return ObjectModel(
      title: parsJson["title"],
      remainingPoints: parsJson["remaining_points"],
      totalPointsCount: parsJson["total_points_count"],
      points: (parsJson["points"] as List)
          .map((e) => PointModel.fromJson(e))
          .toList(),
    );
  }
}
