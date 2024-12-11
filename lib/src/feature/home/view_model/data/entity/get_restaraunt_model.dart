// To parse this JSON data, do
//
//     final getRestaurantModel = getRestaurantModelFromJson(jsonString);

import 'dart:convert';

GetRestaurantModel getRestaurantModelFromJson(String str) => GetRestaurantModel.fromJson(json.decode(str));

String getRestaurantModelToJson(GetRestaurantModel data) => json.encode(data.toJson());

class GetRestaurantModel {
  final Data? data;
  final bool? success;

  GetRestaurantModel({
    this.data,
    this.success,
  });

  GetRestaurantModel copyWith({
    Data? data,
    bool? success,
  }) =>
      GetRestaurantModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory GetRestaurantModel.fromJson(Map<String, dynamic> json) => GetRestaurantModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "success": success,
      };
}

class Data {
  final num? total;
  final List<Datum>? data;
  final num? totalPages;

  Data({
    this.total,
    this.data,
    this.totalPages,
  });

  Data copyWith({
    num? total,
    List<Datum>? data,
    num? totalPages,
  }) =>
      Data(
        total: total ?? this.total,
        data: data ?? this.data,
        totalPages: totalPages ?? this.totalPages,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalPages": totalPages,
      };
}

class Datum {
  final String? restaurantId;
  final String? name;
  final String? openTime;
  final String? closeTime;
  final String? description;
  final bool? active;
  final num? deliverAmount;
  final String? attachmentId;
  final String? uploadPath;

  Datum({
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

  Datum copyWith({
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
      Datum(
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
