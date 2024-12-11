import 'dart:convert';

import 'foodm.dart';

OrderPostModel orderPostModelFromJson(String str) => OrderPostModel.fromJson(json.decode(str));

String orderPostModelToJson(OrderPostModel data) => json.encode(data.toJson());

class OrderPostModel {
  final String? location;
  final List<Fooddd>? fooddds;
  final String? description;
  final num? foodddsAmount;
  final num? deliverAmount;
  final num? allAmount;

  OrderPostModel({
    this.location,
    this.fooddds,
    this.description,
    this.foodddsAmount,
    this.deliverAmount,
    this.allAmount,
  });

  OrderPostModel copyWith({
    String? location,
    List<Fooddd>? fooddds,
    String? description,
    num? foodddsAmount,
    num? deliverAmount,
    num? allAmount,
  }) =>
      OrderPostModel(
        location: location ?? this.location,
        fooddds: fooddds ?? this.fooddds,
        description: description ?? this.description,
        foodddsAmount: foodddsAmount ?? this.foodddsAmount,
        deliverAmount: deliverAmount ?? this.deliverAmount,
        allAmount: allAmount ?? this.allAmount,
      );

  factory OrderPostModel.fromJson(Map<String, dynamic> json) => OrderPostModel(
        location: json["location"],
        fooddds: json["fooddds"] == null ? [] : List<Fooddd>.from(json["Fooddds"]!.map((x) => Fooddd.fromJson(x))),
        description: json["description"],
        foodddsAmount: json["FoodddsAmount"],
        deliverAmount: json["deliverAmount"],
        allAmount: json["allAmount"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "foods": fooddds == null ? [] : List<dynamic>.from(fooddds!.map((x) => x.toJson())),
        "description": description,
        "foodsAmount": foodddsAmount,
        "deliverAmount": deliverAmount,
        "allAmount": allAmount,
      };
}
