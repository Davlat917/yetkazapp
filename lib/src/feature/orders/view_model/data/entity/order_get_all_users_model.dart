import 'dart:convert';

OrderGetAllUsersModel orderGetAllUsersModelFromJson(String str) => OrderGetAllUsersModel.fromJson(json.decode(str));

String orderGetAllUsersModelToJson(OrderGetAllUsersModel data) => json.encode(data.toJson());

class OrderGetAllUsersModel {
  final Data? data;
  final bool? success;

  OrderGetAllUsersModel({
    this.data,
    this.success,
  });

  OrderGetAllUsersModel copyWith({
    Data? data,
    bool? success,
  }) =>
      OrderGetAllUsersModel(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory OrderGetAllUsersModel.fromJson(Map<String, dynamic> json) => OrderGetAllUsersModel(
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