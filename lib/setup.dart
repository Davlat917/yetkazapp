import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_storage_model.dart';

late Box<FoodStorageModel> boxFood;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(FoodStorageModelAdapter());
  boxFood = await Hive.openBox<FoodStorageModel>("food");
}
