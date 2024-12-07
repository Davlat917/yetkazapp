import 'package:hive/hive.dart';

part 'food_storage_model.g.dart';

@HiveType(typeId: 0)
class FoodStorageModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final String? uploadPath;
  @HiveField(5)
  final int? count;

  FoodStorageModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.uploadPath,
    this.count,
  });
}
