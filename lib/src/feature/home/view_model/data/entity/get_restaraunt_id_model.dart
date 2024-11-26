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
  final dynamic deliverAmount;
  final List<Food>? food;
  final Category? category;

  Data({
    this.restaurantId,
    this.name,
    this.openTime,
    this.closeTime,
    this.description,
    this.active,
    this.deliverAmount,
    this.food,
    this.category,
  });

  Data copyWith({
    String? restaurantId,
    String? name,
    String? openTime,
    String? closeTime,
    String? description,
    bool? active,
    dynamic deliverAmount,
    List<Food>? food,
    Category? category,
  }) =>
      Data(
        restaurantId: restaurantId ?? this.restaurantId,
        name: name ?? this.name,
        openTime: openTime ?? this.openTime,
        closeTime: closeTime ?? this.closeTime,
        description: description ?? this.description,
        active: active ?? this.active,
        deliverAmount: deliverAmount ?? this.deliverAmount,
        food: food ?? this.food,
        category: category ?? this.category,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        restaurantId: json["restaurantId"],
        name: json["name"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        description: json["description"],
        active: json["active"],
        deliverAmount: json["deliverAmount"],
        food: json["food"] == null ? [] : List<Food>.from(json["food"]!.map((x) => Food.fromJson(x))),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "name": name,
        "openTime": openTime,
        "closeTime": closeTime,
        "description": description,
        "active": active,
        "deliverAmount": deliverAmount,
        "food": food == null ? [] : List<dynamic>.from(food!.map((x) => x.toJson())),
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
        "categoryType": categoryType,
      };
}

class Food {
  final String? id;
  final String? name;
  final String? description;
  final num? price; // Changed from int? to num?
  final bool? active;
  final String? restaurantId;
  final Category? category;

  Food({
    this.id,
    this.name,
    this.description,
    this.price,
    this.active,
    this.restaurantId,
    this.category,
  });

  Food copyWith({
    String? id,
    String? name,
    String? description,
    num? price, // Updated type here as well
    bool? active,
    String? restaurantId,
    Category? category,
  }) =>
      Food(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        active: active ?? this.active,
        restaurantId: restaurantId ?? this.restaurantId,
        category: category ?? this.category,
      );

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"], // No conversion is needed, as num handles both int and double
        active: json["active"],
        restaurantId: json["restaurantId"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price, // No conversion is needed here as well
        "active": active,
        "restaurantId": restaurantId,
        "category": category?.toJson(),
      };
}
