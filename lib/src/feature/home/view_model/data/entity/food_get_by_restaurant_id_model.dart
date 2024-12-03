// To parse this JSON data, do
//
//     final foodGetByRestaurantIdModel = foodGetByRestaurantIdModelFromJson(jsonString);

import 'dart:convert';

FoodGetByRestaurantIdModel foodGetByRestaurantIdModelFromJson(String str) => FoodGetByRestaurantIdModel.fromJson(json.decode(str));

String foodGetByRestaurantIdModelToJson(FoodGetByRestaurantIdModel data) => json.encode(data.toJson());

class FoodGetByRestaurantIdModel {
  final Data? data;
  final bool? success;

  FoodGetByRestaurantIdModel({
    this.data,
    this.success,
  });

  FoodGetByRestaurantIdModel copyWith({
    Data? data,
    bool? success,
  }) =>
      FoodGetByRestaurantIdModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory FoodGetByRestaurantIdModel.fromJson(Map<String, dynamic> json) => FoodGetByRestaurantIdModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "success": success,
      };
}

class Data {
  final int? total;
  final List<Datum>? data;
  final int? totalPages;

  Data({
    this.total,
    this.data,
    this.totalPages,
  });

  Data copyWith({
    int? total,
    List<Datum>? data,
    int? totalPages,
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
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final bool? active;
  final String? restaurantId;
  final String? attachmentId;
  final String? uploadPath;
  final Category? category;

  Datum({
    this.id,
    this.name,
    this.description,
    this.price,
    this.active,
    this.restaurantId,
    this.attachmentId,
    this.uploadPath,
    this.category,
  });

  Datum copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    bool? active,
    String? restaurantId,
    String? attachmentId,
    String? uploadPath,
    Category? category,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        active: active ?? this.active,
        restaurantId: restaurantId ?? this.restaurantId,
        attachmentId: attachmentId ?? this.attachmentId,
        uploadPath: uploadPath ?? this.uploadPath,
        category: category ?? this.category,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        active: json["active"],
        restaurantId: json["restaurantId"],
        attachmentId: json["attachmentId"],
        uploadPath: json["uploadPath"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "active": active,
        "restaurantId": restaurantId,
        "attachmentId": attachmentId,
        "uploadPath": uploadPath,
        "category": category?.toJson(),
      };
}

class Category {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;
  final String? updatedBy;
  final dynamic state;
  final bool? deleted;
  final String? name;
  final String? description;
  final String? attachmentId;
  final String? categoryType;

  Category({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.state,
    this.deleted,
    this.name,
    this.description,
    this.attachmentId,
    this.categoryType,
  });

  Category copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
    String? updatedBy,
    dynamic state,
    bool? deleted,
    String? name,
    String? description,
    String? attachmentId,
    String? categoryType,
  }) =>
      Category(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        state: state ?? this.state,
        deleted: deleted ?? this.deleted,
        name: name ?? this.name,
        description: description ?? this.description,
        attachmentId: attachmentId ?? this.attachmentId,
        categoryType: categoryType ?? this.categoryType,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        state: json["state"],
        deleted: json["deleted"],
        name: json["name"],
        description: json["description"],
        attachmentId: json["attachmentId"],
        categoryType: json["categoryType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "state": state,
        "deleted": deleted,
        "name": name,
        "description": description,
        "attachmentId": attachmentId,
        "categoryType": categoryType,
      };
}
