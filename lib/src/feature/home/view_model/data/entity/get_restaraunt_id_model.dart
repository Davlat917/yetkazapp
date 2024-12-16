// To parse this JSON data, do
//
//     final getRestaurantIdModel = getRestaurantIdModelFromJson(jsonString);

import 'dart:convert';

GetRestaurantIdModel getRestaurantIdModelFromJson(String str) => GetRestaurantIdModel.fromJson(json.decode(str));

String getRestaurantIdModelToJson(GetRestaurantIdModel data) => json.encode(data.toJson());

class GetRestaurantIdModel {
  final Data? data;
  final bool? success;

  GetRestaurantIdModel({
    this.data,
    this.success,
  });

  GetRestaurantIdModel copyWith({
    Data? data,
    bool? success,
  }) =>
      GetRestaurantIdModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory GetRestaurantIdModel.fromJson(Map<String, dynamic> json) => GetRestaurantIdModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "success": success,
      };
}

class Data {
  final String? restaurantId;
  final String? name;
  final String? openTime;
  final String? closeTime;
  final String? description;
  final bool? active;
  final num? deliverAmount;
  final String? attachmentId;
  final List<String>? categoryNames;
  final String? uploadPath;

  Data({
    this.restaurantId,
    this.name,
    this.openTime,
    this.closeTime,
    this.description,
    this.active,
    this.deliverAmount,
    this.attachmentId,
    this.categoryNames,
    this.uploadPath,
  });

  Data copyWith({
    String? restaurantId,
    String? name,
    String? openTime,
    String? closeTime,
    String? description,
    bool? active,
    num? deliverAmount,
    String? attachmentId,
    List<String>? categoryNames,
    String? uploadPath,
  }) =>
      Data(
        restaurantId: restaurantId ?? this.restaurantId,
        name: name ?? this.name,
        openTime: openTime ?? this.openTime,
        closeTime: closeTime ?? this.closeTime,
        description: description ?? this.description,
        active: active ?? this.active,
        deliverAmount: deliverAmount ?? this.deliverAmount,
        attachmentId: attachmentId ?? this.attachmentId,
        categoryNames: categoryNames ?? this.categoryNames,
        uploadPath: uploadPath ?? this.uploadPath,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        restaurantId: json["restaurantId"],
        name: json["name"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        description: json["description"],
        active: json["active"],
        deliverAmount: json["deliverAmount"],
        attachmentId: json["attachmentId"],
        categoryNames: json["categoryNames"] == null ? [] : List<String>.from(json["categoryNames"]!.map((x) => x)),
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
        "categoryNames": categoryNames == null ? [] : List<dynamic>.from(categoryNames!.map((x) => x)),
        "uploadPath": uploadPath,
      };
}
