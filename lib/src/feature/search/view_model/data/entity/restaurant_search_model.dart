// To parse this JSON data, do
//
//     final searchRestaurantModel = searchRestaurantModelFromJson(jsonString);

import 'dart:convert';

SearchRestaurantModel searchRestaurantModelFromJson(String str) => SearchRestaurantModel.fromJson(json.decode(str));

String searchRestaurantModelToJson(SearchRestaurantModel data) => json.encode(data.toJson());

class SearchRestaurantModel {
  final List<DatumRestaurant>? data;
  final bool? success;

  SearchRestaurantModel({
    this.data,
    this.success,
  });

  SearchRestaurantModel copyWith({
    List<DatumRestaurant>? data,
    bool? success,
  }) =>
      SearchRestaurantModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory SearchRestaurantModel.fromJson(Map<String, dynamic> json) => SearchRestaurantModel(
        data: json["data"] == null ? [] : List<DatumRestaurant>.from(json["data"]!.map((x) => DatumRestaurant.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
      };
}

class DatumRestaurant {
  final String? restaurantId;
  final String? name;
  final String? openTime;
  final String? closeTime;
  final String? description;
  final bool? active;
  final num? deliverAmount;
  final String? attachmentId;
  final String? uploadPath;

  DatumRestaurant({
    this.restaurantId,
    this.name,
    this.openTime,
    this.closeTime,
    this.description,
    this.active,
    this.deliverAmount,
    this.attachmentId,
    this.uploadPath,
  });

  DatumRestaurant copyWith({
    String? restaurantId,
    String? name,
    String? openTime,
    String? closeTime,
    String? description,
    bool? active,
    num? deliverAmount,
    String? attachmentId,
    String? uploadPath,
  }) =>
      DatumRestaurant(
        restaurantId: restaurantId ?? this.restaurantId,
        name: name ?? this.name,
        openTime: openTime ?? this.openTime,
        closeTime: closeTime ?? this.closeTime,
        description: description ?? this.description,
        active: active ?? this.active,
        deliverAmount: deliverAmount ?? this.deliverAmount,
        attachmentId: attachmentId ?? this.attachmentId,
        uploadPath: uploadPath ?? this.uploadPath,
      );

  factory DatumRestaurant.fromJson(Map<String, dynamic> json) => DatumRestaurant(
        restaurantId: json["restaurantId"],
        name: json["name"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        description: json["description"],
        active: json["active"],
        deliverAmount: json["deliverAmount"],
        attachmentId: json["attachmentId"],
        uploadPath: json["uploadPath"],
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "name": name,
        "openTime": openTime,
        "closeTime": closeTime,
        "description": description,
        "active": active,
        "deliverAmount": deliverAmount,
        "attachmentId": attachmentId,
        "uploadPath": uploadPath,
      };
}
