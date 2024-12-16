import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_detail_page.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/bottom_sheet_widget.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/detail_restaraunt_id.dart';
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
    var ctrDetail = ref.read(restaurantDetailVm);
    ref.watch(restaurantDetailVm);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          controller: controller,
          onChanged: (value) {
            if (value.trim().isNotEmpty) {
              ctr.focusPage();
              ctr.getSearchFoodFunctionVm(query: value);
              ctr.getSearchRestaurantFunctionVm(queryRestaurant: value);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("noResult".tr()),
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
      body: (ctr.textActive || (ctr.restaurants!.isEmpty && ctr.foods!.isEmpty))
          ? Padding(
              padding: REdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  Text(
                    "search".tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurants Section
                  if (ctr.restaurants != null && ctr.restaurants!.isNotEmpty)
                    Padding(
                      padding: REdgeInsets.only(left: 12, top: 16),
                      child: Text(
                        "restaurants".tr(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  // const Divider(),
                  ...List.generate(
                    ctr.restaurants?.length ?? 0,
                    (index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              final restaurant = ctr.searchRestaurantModel?.data?[index];
                              if (restaurant == null) return;

                              ctrDetail.getRestaurantId(
                                resID: ctrHome.getRestaurantModel!.data!.data![index].restaurantId.toString(),
                              );
                              ctrHome.getFoodByRestaurant(
                                page: 0,
                                restaurantId: ctrHome.getRestaurantModel!.data!.data![index].restaurantId.toString(),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeDetailPage(),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "${ApiConst.baseUrl}${ctr.searchRestaurantModel!.data![index].uploadPath?.substring(21) ?? ''}",
                              ),
                            ),
                            title: Text(ctr.searchRestaurantModel!.data![index].name ?? 'No Name'),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                  // Foods Section
                  if (ctr.foods != null && ctr.foods!.isNotEmpty)
                    Padding(
                      padding: REdgeInsets.only(left: 12, top: 16),
                      child: Text(
                        "foods".tr(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  // const Divider(),
                  ...List.generate(
                    ctr.foods?.length ?? 0,
                    (index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              showModalBottomSheet(
                                useSafeArea: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  final food = ctr.foods![index];
                                  return BottomSheetWidget(
                                    id: food.id ?? '',
                                    image: '${ApiConst.baseUrl}${food.uploadPath?.substring(21) ?? ''}',
                                    name: food.name ?? 'No Name',
                                    description: food.description ?? 'No Description',
                                    price: food.price?.toInt() ?? 0,
                                  );
                                },
                              );
                            },
                            leading: Image.network(
                              "${ApiConst.baseUrl}${ctr.foods![index].uploadPath?.substring(21) ?? ''}",
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                            ),
                            title: Text(ctr.foods![index].name ?? 'No Name'),
                            subtitle: Text(ctr.foods![index].description ?? 'No Description'),
                            // trailing: Text(
                            //   "${ctr.foods![index].price?.toString().substring(0, 5) ?? '0'} ${"so'm".tr()}",
                            // ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
