// To parse this JSON data, do
//
//     final searchFoodModel = searchFoodModelFromJson(jsonString);

import 'dart:convert';

SearchFoodModel searchFoodModelFromJson(String str) => SearchFoodModel.fromJson(json.decode(str));

String searchFoodModelToJson(SearchFoodModel data) => json.encode(data.toJson());

class SearchFoodModel {
  final List<Datum>? data;
  final bool? success;

  SearchFoodModel({
    this.data,
    this.success,
  });

  SearchFoodModel copyWith({
    List<Datum>? data,
    bool? success,
  }) =>
      SearchFoodModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory SearchFoodModel.fromJson(Map<String, dynamic> json) => SearchFoodModel(
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
  final num? price;
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
    num? price,
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
  final String? restaurantId;
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
    this.restaurantId,
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
    String? restaurantId,
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
        restaurantId: restaurantId ?? this.restaurantId,
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
        restaurantId: json["restaurantId"],
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
        "restaurantId": restaurantId,
        "categoryType": categoryType,
      };
}
