import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/core/widgets/shimmer_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_page.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_savat_page.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/bottom_sheet_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/foods_shimmer_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/restaraunt_info_widget.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/detail_restaraunt_id.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_detail_vm.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/savat_vm.dart';

final savatchaVisibleProvider = StateProvider<bool>((ref) => false);
final selectedCategoryIndexProvider = StateProvider<int?>((ref) => 0);

class HomeDetailPage extends ConsumerWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // new
    var ctrIDetail = ref.read(restaurantDetailVm);
    ref.watch(restaurantDetailVm);

    //
    var ctrHome = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);
    var ctr = ref.read(homeDetailVmProvider);
    ref.watch(homeDetailVmProvider);
    var ctrSavat = ref.read(savatVmProvider);
    ref.watch(savatVmProvider);
    // bool isSavatchaVisible = ref.watch(savatchaVisibleProvider);
    int? selectedIndex = ref.watch(selectedCategoryIndexProvider);

    bool isS = isOpen(
      ctrIDetail.getRestaurantIdModel!.data!.openTime.toString(),
      ctrIDetail.getRestaurantIdModel!.data!.closeTime.toString(),
    );

    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      // ctr.getCategoryAllForRestaurantVm(foodCategoryId: ctrIDetail.getRestaurantIdModel!.data!.restaurantId.toString());

      // getCategoryAllForRestaurantVm(foodCategoryId: getRestaurantIdModel!.data!.restaurantId.toString());

      // getFoodAllByCategoryId(id: categoryGetAllForRestaurantModel!.data![0].id.toString(), page: 0);
      // getCategoryAllForRestaurantVm(foodCategoryId: foodGetAllByCategoryIdModel!.data!.data![0].id.toString());
      // }),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ButtonNavigationBar()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          ctrIDetail.getRestaurantIdModel!.data!.name.toString(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 300.0,
                          width: double.infinity,
                          child: Image.network(
                            "${ApiConst.baseUrl}${ctrIDetail.getRestaurantIdModel!.data!.uploadPath.toString().substring(21)}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        !isS
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 160.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10.r),
                                    ),
                                    color: Colors.black54,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Yopiq',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        Padding(
                          padding: REdgeInsets.only(top: 150, bottom: 20),
                          child: RestaurantInfoWidget(
                            restaurantsCategory: ctrIDetail.getRestaurantIdModel!.data!.categoryNames,
                            restaurantName: ctrIDetail.getRestaurantIdModel!.data!.name.toString(),
                            restaurantDate:
                                "${ctrIDetail.getRestaurantIdModel!.data!.openTime.toString().substring(0, 5)} - ${ctrIDetail.getRestaurantIdModel!.data!.closeTime.toString().substring(0, 5)}",
                            restaurantPrice: ctrIDetail.getRestaurantIdModel!.data!.deliverAmount
                                .toString()
                                .substring(0, ctrIDetail.getRestaurantIdModel!.data!.deliverAmount.toString().length - 2),
                            // substring(0, ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].price!.toString().length - 2)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      minHeight: 50.0.h,
                      maxHeight: 50.0.h,
                      child: Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 23.h,
                          width: double.maxFinite,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ctrIDetail.categoryGetAllForRestaurantModel!.data!.length,
                            itemBuilder: (context, index) {
                              // bool isSelected = selectedIndex == index;
                              return Padding(
                                padding: REdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                child: SizedBox(
                                  height: 10.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: ctrIDetail.categoryGetAllForRestaurantModel!.data!.length,
                                    itemBuilder: (context, index) {
                                      bool isSelected = selectedIndex == index;
                                      return Padding(
                                        padding: REdgeInsets.only(left: 5, right: 5),
                                        child: ctrIDetail.loadingFoodCategory
                                            ? ShimmerWidget(
                                                child: SizedBox(
                                                  height: 10.0.h,
                                                  width: 85.w,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 5.h,
                                                child: MaterialButton(
                                                  elevation: 0,
                                                  height: 10.0.h,
                                                  minWidth: 85.w,
                                                  padding: EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  color: isSelected ? const Color(0xffffe434) : const Color(0xfff2f2f2),
                                                  onPressed: () {
                                                    ctrIDetail.getFoodAllByCategoryId(
                                                        id: ctrIDetail.categoryGetAllForRestaurantModel!.data![index].id.toString(),
                                                        page: 0);
                                                    ref.read(selectedCategoryIndexProvider.notifier).state = index;
                                                  },
                                                  child: Text(
                                                    "${ctrIDetail.categoryGetAllForRestaurantModel!.data![index].name}",
                                                    // "donar".tr(),
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: ctrIDetail.loadingFoodCategory
                  ? const CupertinoActivityIndicator()
                  : Padding(
                      padding: REdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        itemCount: ctrIDetail.foodGetAllByCategoryIdModel!.data!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ctrIDetail.loadingFoods
                              ? const FoodsShimmerWidget()
                              : SizedBox(
                                  // height: 100.h,
                                  height: MediaQuery.of(context).size.height * 0.13.h,
                                  child: Card(
                                    color: Colors.white,
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
                                                  "${ApiConst.baseUrl}${ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].uploadPath.toString().substring(21)}",
                                              // image:
                                              //     '${ApiConst.baseUrl}${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].uploadPath.toString().substring(21)}',
                                              // name: '${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].name}',
                                              name: ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].name.toString(),
                                              description: '${ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].description}',
                                              // price: ctrHome.foodGetByRestaurantIdModel!.data!.data![index].price!.toInt(),
                                              price: ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].price!.toInt(),
                                              // id: '${ctrHome.foodGetByRestaurantIdModel!.data!.data![index].id}',
                                              id: ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].id.toString(),
                                            );
                                          },
                                        );
                                      },
                                      title: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].name.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].description.toString(),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "${ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].price!.toString().substring(0, ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].price!.toString().length - 2)} ${"so'm".tr()}",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: SizedBox(
                                          height: 100.h,
                                          // width: 150.w,
                                          child: Image.network(
                                            "${ApiConst.baseUrl}${ctrIDetail.foodGetAllByCategoryIdModel!.data!.data![index].uploadPath.toString().substring(21)}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
            ),
          ),
          if (boxFood.length > 0)
            Padding(
              padding: REdgeInsets.only(bottom: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade600,
                  minimumSize: Size(double.infinity, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  ctrSavat.jamiSumma();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeSavatPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 25.h,
                      width: 25.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "${boxFood.length}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    1.verticalSpace,
                    Text(
                      "savatcha".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      "${ctrSavat.sum} ${"so'm".tr()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
