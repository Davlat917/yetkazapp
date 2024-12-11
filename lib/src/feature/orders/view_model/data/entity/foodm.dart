class Fooddd {
  final String? foodId;
  final int? count;

  Fooddd({
    this.foodId,
    this.count,
  });

  Fooddd copyWith({
    String? foodId,
    int? count,
  }) =>
      Fooddd(
        foodId: foodId ?? this.foodId,
        count: count ?? this.count,
      );

  factory Fooddd.fromJson(Map<String, dynamic> json) => Fooddd(
        foodId: json["foodId"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "count": count,
      };
}
