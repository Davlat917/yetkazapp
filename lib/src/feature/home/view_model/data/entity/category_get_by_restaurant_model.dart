import 'dart:convert';

CategoryGetByRestaurantModel categoryGetByRestaurantModelFromJson(String str) => CategoryGetByRestaurantModel.fromJson(json.decode(str));

String categoryGetByRestaurantModelToJson(CategoryGetByRestaurantModel data) => json.encode(data.toJson());

class CategoryGetByRestaurantModel {
  final List<Datum>? data;
  final bool? success;

  CategoryGetByRestaurantModel({
    this.data,
    this.success,
  });

  CategoryGetByRestaurantModel copyWith({
    List<Datum>? data,
    bool? success,
  }) =>
      CategoryGetByRestaurantModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory CategoryGetByRestaurantModel.fromJson(Map<String, dynamic> json) => CategoryGetByRestaurantModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
      };
}

class Datum {
  final String? id;
  final String? name;
  final String? description;
  final String? categoryType;

  Datum({
    this.id,
    this.name,
    this.description,
    this.categoryType,
  });

  Datum copyWith({
    String? id,
    String? name,
    String? description,
    String? categoryType,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        categoryType: categoryType ?? this.categoryType,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryType: json["categoryType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "categoryType": categoryType,
      };
}
