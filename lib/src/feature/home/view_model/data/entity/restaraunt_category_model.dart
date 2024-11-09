import 'dart:convert';

List<RestaurantCategoryModel> restaurantCategoryModelFromJson(String str) =>
    List<RestaurantCategoryModel>.from(json.decode(str).map((x) => RestaurantCategoryModel.fromJson(x)));

String restaurantCategoryModelToJson(List<RestaurantCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantCategoryModel {
  final int? id;
  final String? name;
  final String? logo;
  final String? photo;
  final String? workStartTime;
  final String? workEndTime;
  final int? servicePrice;
  final int? category;

  RestaurantCategoryModel({
    this.id,
    this.name,
    this.logo,
    this.photo,
    this.workStartTime,
    this.workEndTime,
    this.servicePrice,
    this.category,
  });

  RestaurantCategoryModel copyWith({
    int? id,
    String? name,
    String? logo,
    String? photo,
    String? workStartTime,
    String? workEndTime,
    int? servicePrice,
    int? category,
  }) =>
      RestaurantCategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        logo: logo ?? this.logo,
        photo: photo ?? this.photo,
        workStartTime: workStartTime ?? this.workStartTime,
        workEndTime: workEndTime ?? this.workEndTime,
        servicePrice: servicePrice ?? this.servicePrice,
        category: category ?? this.category,
      );

  factory RestaurantCategoryModel.fromJson(Map<String, dynamic> json) => RestaurantCategoryModel(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        photo: json["photo"],
        workStartTime: json["work_start_time"],
        workEndTime: json["work_end_time"],
        servicePrice: json["service_price"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "photo": photo,
        "work_start_time": workStartTime,
        "work_end_time": workEndTime,
        "service_price": servicePrice,
        "category": category,
      };
}
