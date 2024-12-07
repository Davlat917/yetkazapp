import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/bottom_sheet_widget.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_detail_vm.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';
import 'package:tezyetkazz/src/feature/search/view_model/vm/search_vm.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(searchVmProvider);
    ref.watch(searchVmProvider);
    var ctrHomeDetail = ref.read(homeDetailVmProvider);
    ref.watch(homeDetailVmProvider);
    var ctrHome = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          controller: controller,
          onChanged: (value) {
            if (value.trim().length > 0) {
              ctr.focusPage();
              ctr.getSearchFoodFunctionVm(query: value);
              ctr.getSearchRestaurantFunctionVm(queryRestaurant: value);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("So'rovingiz bo'yicha hech narsa topilmadi"),
                ),
              );
              ctr.focusPage(isActive: true);
            }
          },
          decoration: InputDecoration(
            hintText: 'qidirish'.tr(),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              onPressed: () async {
                // await AppStorage.$delete(key: StorageKey.accessToken);
                controller.clear();
                ctr.focusPage(isActive: true);
              },
              icon: Icon(
                CupertinoIcons.clear_circled_solid,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            // filled: true,
            // fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                4.sp,
              ),
              borderSide: const BorderSide(color: Colors.black),
            ),
            contentPadding: REdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
        ),
      ),
      body: ctr.textActive
          ? Center(
              child: Text("NO DATA"),
            )
          : (ctr.restaurants!.isEmpty &&
                  ctr.foods!.isEmpty &&
                  controller.text.isEmpty)
              ? Center(
                  child: Text("No Data"),
                )
              : Column(
                  children: [
                    ...List.generate(
                      ctr.foods!.length,
                      (index) {
                        return Card(
                          elevation: 3,
                          child: ListTile(
                            onTap: () {
                              showModalBottomSheet(
                                useSafeArea: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetWidget(
                                    image:
                                        '${ApiConst.baseUrl}${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].uploadPath.toString().substring(21)}',
                                    name:
                                        '${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].name}',
                                    description:
                                        '${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].description}',
                                    price: ctrHome.foodGetByRestaurantIdModel!
                                        .data!.data![index].price!
                                        .toInt(),
                                  );
                                },
                              );
                            },
                            leading: Image.network(
                                "${ApiConst.baseUrl}${ctr.searchFoodModel!.data![index].uploadPath!.substring(21)}"),
                            title: Text("${ctr.foods![index].name}"),
                            subtitle: Text(
                                "${ctr.searchFoodModel!.data![index].description}"),
                            trailing: Text(
                                "${ctr.searchFoodModel!.data![index].price.toString().substring(0, 5)} ${"so'm".tr()}"),
                          ),
                        );
                      },
                    ),
                    ...List.generate(
                      ctr.restaurants!.length,
                      (index) {
                        return Card(
                          elevation: 3,
                          child: ListTile(
                            onTap: () {
                              ctrHomeDetail.getRestaurantId(
                                context: context,
                                restaurantId: ctrHome.getRestaurantModel!.data!
                                    .data![index].restaurantId
                                    .toString(),
                              );
                              ctrHome.getFoodByRestaurant(
                                page: 0,
                                restaurantId: ctrHome.getRestaurantModel!.data!
                                    .data![index].restaurantId
                                    .toString(),
                              );
                            },
                            leading: Image.network(
                                "${ApiConst.baseUrl}${ctr.searchRestaurantModel!.data![index].uploadPath!.substring(21)}"),
                            title: Text(
                                "${ctr.searchRestaurantModel!.data![index].name}"),
                            // trailing:
                            //     Text("${ctr.searchRestaurantModel!.data![index].deliverAmount.toString().substring(0, 5)} ${"so'm".tr()}"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
    );
  }
}
