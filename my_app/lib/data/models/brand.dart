class BrandModel {
  final String name;
  BrandModel({
    required this.name
  });
  factory BrandModel.fromJson(dynamic json) {
    return BrandModel(
        name: json['name'] as String);
  }
}