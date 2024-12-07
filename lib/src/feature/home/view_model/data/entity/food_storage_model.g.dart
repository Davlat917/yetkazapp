// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_storage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodStorageModelAdapter extends TypeAdapter<FoodStorageModel> {
  @override
  final int typeId = 0;

  @override
  FoodStorageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodStorageModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      price: fields[3] as num?,
      uploadPath: fields[4] as String?,
      count: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodStorageModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.uploadPath)
      ..writeByte(5)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodStorageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
