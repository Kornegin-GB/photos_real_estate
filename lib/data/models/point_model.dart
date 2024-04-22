class PointModel {
  final num x;
  final num y;
  final String status;

  PointModel({
    required this.x,
    required this.y,
    required this.status,
  });

  factory PointModel.fromJson(Map<String, dynamic> parsJson) {
    return PointModel(
      x: parsJson["x"],
      y: parsJson["y"],
      status: parsJson["status"],
    );
  }
}
