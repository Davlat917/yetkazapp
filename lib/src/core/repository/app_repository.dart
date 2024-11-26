import 'package:tezyetkazz/src/feature/home/view_model/data/entity/head_category_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/restaraunt_category_model.dart';

abstract class AppRepo {
  AppRepo._();

  void registerPostData({
    required String email,
  });

  Future<List<HeadCategoryModel>> headCategoryGet();

  Future<GetAllCategoryModel> getAllCategory();
}
