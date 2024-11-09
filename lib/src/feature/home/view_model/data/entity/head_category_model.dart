import 'dart:convert';

List<HeadCategoryModel> headCategoryModelFromJson(String str) =>
    List<HeadCategoryModel>.from(json.decode(str).map((x) => HeadCategoryModel.fromJson(x)));

String headCategoryModelToJson(List<HeadCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeadCategoryModel {
  final String? name;
  final String? photo;

  HeadCategoryModel({
    this.name,
    this.photo,
  });

  HeadCategoryModel copyWith({
    String? name,
    String? photo,
  }) =>
      HeadCategoryModel(
        name: name ?? this.name,
        photo: photo ?? this.photo,
      );

  factory HeadCategoryModel.fromJson(Map<String, dynamic> json) => HeadCategoryModel(
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
      };
}
