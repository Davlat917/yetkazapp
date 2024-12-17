import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_detail_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_storage_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/detail_restaraunt_id.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_detail_vm.dart';

class BottomSheetWidget extends ConsumerWidget {
  final String image;
  final String name;
  final String description;
  final num price;
  final String id;

  const BottomSheetWidget({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeDetailVmProvider);
    ref.watch(homeDetailVmProvider);
    var ctrDetail = ref.read(restaurantDetailVm);
    ref.watch(restaurantDetailVm);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              image,
              // "${ApiConst.baseUrl}${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].uploadPath.toString().substring(21)}",
              // width: 250.w,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          20.verticalSpace,
          Text(
            name,
            // "${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].name}",
            // "pepperoni pitsa".tr(),
            style: TextStyle(
              fontSize: 22.sp,
            ),
          ),
          Text(description),
          // Text("tayyorlanish".tr()),
          40.verticalSpace,
          Center(
            child: SizedBox(
              height: 50.h,
              width: 150.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        minWidth: 40.w,
                        height: 40.h,
                        color: Colors.grey.shade400,
                        onPressed: () {
                          ctr.decrement();
                        },
                        child: const Text("-"),
                      ),
                      Text("${ctr.count}"),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        minWidth: 40.w,
                        height: 40.h,
                        color: Colors.yellow.shade600,
                        onPressed: () {
                          ctr.increment();
                        },
                        child: const Text("+"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          CupertinoElevetedButtonWidget(
            onPressed: () async {
              // Mahsulotni savatdan qidirish
              int existingIndex = boxFood.values.toList().indexWhere((item) => item.name == name);
              String? yesToken = await AppStorage.$read(key: StorageKey.accessToken);
              if (yesToken != null) {
                if (existingIndex != -1) {
                  // Agar mahsulot mavjud bo'lsa, uning count ni oshirish
                  var existingProduct = boxFood.getAt(existingIndex);
                  ctr.foodStorageUpdate(
                    index: existingIndex,
                    id: existingProduct!.id,
                    name: name,
                    uploadPath: existingProduct.uploadPath,
                    price: existingProduct.price,
                    currentCount: existingProduct.count! + ctr.count,
                  );
                } else {
                  // Agar mahsulot yo'q bo'lsa, yangi mahsulot qo'shish
                  ctr.foodStorageAdd(
                    id: id,
                    name: name,
                    uploadPath: image,
                    price: price,
                    currentCount: ctr.count,
                  );
                  // await boxFood.add(FoodStorageModel(
                  //   id: id,
                  //   name: name,
                  //   uploadPath: image,
                  //   price: price,
                  //   count: ctr.count,
                  // ));
                }
                // Savatni ko‘rinadigan qilish
                ref.read(savatchaVisibleProvider.notifier).state = true;
                Navigator.pop(context);
              } else {
                ctrDetail.tokenBox();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ButtonNavigationBar(),
                  ),
                  (context) => false,
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "addsavat".tr(),
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  "$price ${"so'm".tr()}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
