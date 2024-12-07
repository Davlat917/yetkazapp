import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_storage_model.dart';

final savatVmProvider = ChangeNotifierProvider((ref) => SavatVm());

class SavatVm extends ChangeNotifier {
  SavatVm() {
    jamiSumma();
    getDeliverAmount();
  }

  String deliverAmount = "";

  num sum = 0;

  // Jami summani hisoblash
  void jamiSumma() {
    sum = 0; // Reset sum
    for (var item in boxFood.values) {
      sum += (item.price ?? 0) * (item.count ?? 1);
    }
    notifyListeners();
  }

  // Savatdan mahsulotni o'chirish
  void savatDelete(int index) {
    boxFood.deleteAt(index);
    jamiSumma(); // Update the total sum after deletion
  }

  // Mahsulot miqdorini oshirish
  void increment(int index) {
    final before = boxFood.values.toList()[index];
    int count = before.count ?? 0;
    count++;
    boxFood.putAt(
      index,
      FoodStorageModel(
        name: before.name,
        uploadPath: before.uploadPath,
        price: before.price,
        count: count,
      ),
    );
    jamiSumma(); // Update the total sum after increment
  }

  // Mahsulot miqdorini kamaytirish
  void decrement(int index) {
    final before = boxFood.values.toList()[index];
    int count = before.count ?? 0;
    if (count > 1) {
      // Prevent count from going below 1
      count--;
      boxFood.putAt(
        index,
        FoodStorageModel(
          name: before.name,
          uploadPath: before.uploadPath,
          price: before.price,
          count: count,
        ),
      );
      jamiSumma(); // Update the total sum after decrement
    }
  }

  // Savatga mahsulot qo'shish
  void addToCart(FoodStorageModel product) {
    int existingIndex = boxFood.values.toList().indexWhere((item) => item.name == product.name);

    if (existingIndex != -1) {
      // Agar mahsulot mavjud bo'lsa, miqdorini oshirish
      final existingProduct = boxFood.getAt(existingIndex);
      boxFood.putAt(
        existingIndex,
        FoodStorageModel(
          name: existingProduct!.name,
          uploadPath: existingProduct.uploadPath,
          price: existingProduct.price,
          count: (existingProduct.count ?? 0) + product.count!,
        ),
      );
    } else {
      // Yangi mahsulotni qo'shish
      boxFood.add(product);
    }

    jamiSumma(); // Jami summani yangilash
  }

  void getDeliverAmount() async {
    deliverAmount = await AppStorage.$read(key: StorageKey.deliverAmount) ?? "";
  }
}
