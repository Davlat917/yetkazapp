// To parse this JSON data, do
//
//     final orderGetDeliverModel = orderGetDeliverModelFromJson(jsonString);

import 'dart:convert';

OrderGetDeliverModel orderGetDeliverModelFromJson(String str) => OrderGetDeliverModel.fromJson(json.decode(str));

String orderGetDeliverModelToJson(OrderGetDeliverModel data) => json.encode(data.toJson());

class OrderGetDeliverModel {
  final Data? data;
  final bool? success;

  OrderGetDeliverModel({
    this.data,
    this.success,
  });

  OrderGetDeliverModel copyWith({
    Data? data,
    bool? success,
  }) =>
      OrderGetDeliverModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory OrderGetDeliverModel.fromJson(Map<String, dynamic> json) => OrderGetDeliverModel(
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
  final String? orderId;
  final bool? status;
  final bool? deliver;
  final String? location;
  final String? description;
  final String? userId;
  final List<Food>? foods;
  final num? foodsAmount;
  final num? deliverAmount;
  final num? allAmount;
  final String? restaurantName;
  final String? uploadPath;
  final String? attachmentId;
  final DateTime? createdAtOrder;
  final DateTime? updatedAtOrder;

  Datum({
    this.orderId,
    this.status,
    this.deliver,
    this.location,
    this.description,
    this.userId,
    this.foods,
    this.foodsAmount,
    this.deliverAmount,
    this.allAmount,
    this.restaurantName,
    this.uploadPath,
    this.attachmentId,
    this.createdAtOrder,
    this.updatedAtOrder,
  });

  Datum copyWith({
    String? orderId,
    bool? status,
    bool? deliver,
    String? location,
    String? description,
    String? userId,
    List<Food>? foods,
    num? foodsAmount,
    num? deliverAmount,
    num? allAmount,
    String? restaurantName,
    String? uploadPath,
    String? attachmentId,
    DateTime? createdAtOrder,
    DateTime? updatedAtOrder,
  }) =>
      Datum(
        orderId: orderId ?? this.orderId,
        status: status ?? this.status,
        deliver: deliver ?? this.deliver,
        location: location ?? this.location,
        description: description ?? this.description,
        userId: userId ?? this.userId,
        foods: foods ?? this.foods,
        foodsAmount: foodsAmount ?? this.foodsAmount,
        deliverAmount: deliverAmount ?? this.deliverAmount,
        allAmount: allAmount ?? this.allAmount,
        restaurantName: restaurantName ?? this.restaurantName,
        uploadPath: uploadPath ?? this.uploadPath,
        attachmentId: attachmentId ?? this.attachmentId,
        createdAtOrder: createdAtOrder ?? this.createdAtOrder,
        updatedAtOrder: updatedAtOrder ?? this.updatedAtOrder,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["orderId"],
        status: json["status"],
        deliver: json["deliver"],
        location: json["location"],
        description: json["description"],
        userId: json["userId"],
        foods: json["foods"] == null ? [] : List<Food>.from(json["foods"]!.map((x) => Food.fromJson(x))),
        foodsAmount: json["foodsAmount"],
        deliverAmount: json["deliverAmount"],
        allAmount: json["allAmount"],
        restaurantName: json["restaurantName"],
        uploadPath: json["uploadPath"],
        attachmentId: json["attachmentId"],
        createdAtOrder: json["createdAtOrder"] == null ? null : DateTime.parse(json["createdAtOrder"]),
        updatedAtOrder: json["updatedAtOrder"] == null ? null : DateTime.parse(json["updatedAtOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "status": status,
        "deliver": deliver,
        "location": location,
        "description": description,
        "userId": userId,
        "foods": foods == null ? [] : List<dynamic>.from(foods!.map((x) => x.toJson())),
        "foodsAmount": foodsAmount,
        "deliverAmount": deliverAmount,
        "allAmount": allAmount,
        "restaurantName": restaurantName,
        "uploadPath": uploadPath,
        "attachmentId": attachmentId,
        "createdAtOrder": createdAtOrder?.toIso8601String(),
        "updatedAtOrder": updatedAtOrder?.toIso8601String(),
      };
}

class Food {
  final String? foodId;
  final int? count;

  Food({
    this.foodId,
    this.count,
  });

  Food copyWith({
    String? foodId,
    int? count,
  }) =>
      Food(
        foodId: foodId ?? this.foodId,
        count: count ?? this.count,
      );

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        foodId: json["foodId"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "count": count,
      };
}
