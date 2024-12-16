import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/core/widgets/shimmer_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/app_bar_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/home_foods_type_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/home_restaurant_shimmer_widget.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/detail_restaraunt_id.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/savat_vm.dart';
import 'package:tezyetkazz/src/feature/map/view/page/yandex_page.dart';
import 'package:tezyetkazz/src/feature/map/view_model/vm/geocoding_func.dart';
import 'package:tezyetkazz/src/feature/map/view_model/vm/yandex_vm.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'home_detail_page.dart';
import 'home_savat_page.dart';

String? restaurantName = "";

bool isOpen(String begin, String end) {
  log('TIME:$begin,$end');
  String mill = DateFormat("HH:mm:ss").format(DateTime.now()).toString();
  DateFormat timeFormat = DateFormat("HH:mm:ss");
  DateTime startFormat = timeFormat.parse(begin);
  DateTime finishFormat = timeFormat.parse(end);
  DateTime nowFormat = timeFormat.parse(mill);
  int startTime = startFormat.millisecondsSinceEpoch;
  int finishTime = finishFormat.millisecondsSinceEpoch;
  int nowTime = nowFormat.millisecondsSinceEpoch;

  if (nowTime >= startTime && nowTime <= finishTime) {
    return true;
  }
  return false;
}

class HomePage extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Providerni o'qish va boxLen() funksiyasini chaqirish
    var ctrhome = ref.read(homeVmProvider);
    ctrhome.boxLen();
  }

  @override
  void didPopNext() {
    // Sahifaga qaytganda boxLen() funksiyasini chaqirish
    var ctrhome = ref.read(homeVmProvider);
    ctrhome.boxLen();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    // new
    var detailctr = ref.read(restaurantDetailVm);
    ref.watch(restaurantDetailVm);
    //
    var ctr = ref.read(yandexVmProvider);
    ref.watch(yandexVmProvider);
    var ctrhome = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);

    var ctrSavat = ref.read(savatVmProvider);
    ref.watch(savatVmProvider);

    return Scaffold(
        backgroundColor: const Color(0xffffe434),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffffe434),
          toolbarHeight: 50,
          title: InkWell(
            onTap: () async {
              // Navigate to CustomYandexMap and wait for the result
              final selectedLocation = await Navigator.push<Point>(
                context,
                MaterialPageRoute(builder: (_) => const CustomYandexMap()),
              );
              // Check if a location was returned
              if (selectedLocation != null) {
                // Log the selected location to verify
                print("Received location in HomePage: $selectedLocation");
                // Fetch the location name and update provider
                final newLocationName = await getAddressFromLatLong(
                  selectedLocation.latitude,
                  selectedLocation.longitude,
                );
                ctr.locationSet(newLocationName);
                // Log to confirm the provider updated
                print("Updated location name: ${ctr.myLocationName}");
              }
            },
            child: AppBarWidget(
              locationAddress: ctr.myLocationName,
            ),
          ),
        ),
        body: ctrhome.loadingCategory
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 16,
                ),
              )
            : ctrhome.categoryGetByRestaurantModel == null
                ? const Center(
                    child: Text("No Data"),
                  )
                : CustomScrollView(
                    slivers: [
                      CupertinoSliverRefreshControl(
                        onRefresh: () => ctrhome.onRefresh(),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            ctrhome.loadingCategory
                                ? SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: ctrhome.categoryGetByRestaurantModel!.data!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding: REdgeInsets.symmetric(horizontal: 1.w),
                                                child: ShimmerWidget(
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width * 0.18,
                                                    height: 65.h,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius: BorderRadius.circular(16.sp),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              5.verticalSpace,
                                              Padding(
                                                padding: REdgeInsets.symmetric(horizontal: 1.w),
                                                child: ShimmerWidget(
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width * 0.18,
                                                    height: 15.h,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius: BorderRadius.circular(16.sp),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  )
                                : const HomeFoodsTypeWidget(),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22.sp),
                                ),
                              ),
                              child: Padding(
                                padding: REdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    10.verticalSpace,
                                    Text(
                                      ctrhome.categoryName,
                                      style: TextStyle(color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w500),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: ctrhome.getRestaurantModel!.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        bool isS = isOpen(
                                          ctrhome.getRestaurantModel!.data!.data![index].openTime.toString(),
                                          ctrhome.getRestaurantModel!.data!.data![index].closeTime.toString(),
                                        );
                                        log("=========${ctrhome.getRestaurantModel!.data!.data![index].openTime.toString()}");
                                        log("=========${ctrhome.getRestaurantModel!.data!.data![index].closeTime.toString()}");
                                        log("=========$isS");
                                        // bool restaurantCloseTime =
                                        //     (int.parse(ctrhome.getRestaurantModel!.data!.data![index].closeTime.toString().substring(0, 2)) >
                                        //             int.parse(DateTime.now().hour.toString().padLeft(2, "0")) &&
                                        //         int.parse(ctrhome.getRestaurantModel!.data!.data![index].openTime.toString().substring(0, 2)) >
                                        //             int.parse(DateTime.now().hour.toString().padLeft(2, "0")));
                                        return ctrhome.loadingRestaurant
                                            ? const HomeRestaurantShimmerWidget()
                                            : GestureDetector(
                                                onTap: () {
                                                  restaurantName = ctrhome.getRestaurantModel!.data!.data![index].name;
                                                  AppStorage.$write(
                                                      key: StorageKey.restaurantId,
                                                      value: ctrhome.getRestaurantModel!.data!.data![index].restaurantId.toString());
                                                  AppStorage.$write(
                                                    key: StorageKey.deliverAmount,
                                                    value: ctrhome.getRestaurantModel!.data!.data![index].deliverAmount.toString(),
                                                  );
                                                  detailctr.getRestaurantId(
                                                    resID: ctrhome.getRestaurantModel!.data!.data![index].restaurantId.toString(),
                                                  );
                                                  ctrhome.getFoodByRestaurant(
                                                    page: 0,
                                                    restaurantId: ctrhome.getRestaurantModel!.data!.data![index].restaurantId.toString(),
                                                  );
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => const HomeDetailPage(),
                                                    ),
                                                  ).then((_) {
                                                    ref.read(selectedCategoryIndexProvider.notifier).state = 0;
                                                  });
                                                },
                                                child: Container(
                                                  // height: 240.h,
                                                  height: MediaQuery.of(context).size.height * 0.3,
                                                  width: double.infinity,
                                                  margin: REdgeInsets.symmetric(vertical: 8),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.shade300,
                                                        blurRadius: 5,
                                                        offset: const Offset(0, 5),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Stack(
                                                    alignment: Alignment.bottomCenter,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.topCenter,
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              height: 160.h,
                                                              width: double.infinity,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.vertical(
                                                                  top: Radius.circular(16.r),
                                                                ),
                                                                image: DecorationImage(
                                                                  image: NetworkImage(
                                                                    "${ApiConst.baseUrl}${ctrhome.getRestaurantModel!.data!.data![index].uploadPath!.substring(21)}",
                                                                  ),
                                                                  fit: BoxFit.cover,
                                                                ),
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
                                                                      child: Center(
                                                                        child: Text(
                                                                          'close'.tr(),
                                                                          style: const TextStyle(
                                                                            fontSize: 20,
                                                                            color: Colors.red,
                                                                            decoration: TextDecoration.underline,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : const SizedBox.shrink(),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: 92.h,
                                                        height: MediaQuery.of(context).size.height * 0.15,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(10.r),
                                                            bottomRight: Radius.circular(10.r),
                                                            topLeft: Radius.circular(15.r),
                                                            topRight: Radius.circular(15.r),
                                                          ),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              ctrhome.getRestaurantModel!.data!.data![index].name.toString(),
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 18.sp,
                                                              ),
                                                            ),
                                                            Divider(color: Colors.grey.shade300),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      "ish vaqti".tr(),
                                                                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                                                                    ),
                                                                    Text(
                                                                      "${ctrhome.getRestaurantModel!.data!.data![index].openTime?.substring(0, 5)} - ${ctrhome.getRestaurantModel!.data!.data![index].closeTime?.substring(0, 5)}",
                                                                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: 1.w,
                                                                  height: 40.h,
                                                                  color: Colors.grey.shade300,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      "yetkazish".tr(),
                                                                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                                                                    ),
                                                                    Text(
                                                                      "${ctrhome.getRestaurantModel!.data!.data![index].deliverAmount.toString().substring(0, 5)} ${"so'm".tr()}",
                                                                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
        bottomSheet: (ctrhome.storagelen > 0)
            ? Padding(
                padding: REdgeInsets.only(bottom: 0),
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
                        "Savatcha",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        "25 000 so'm",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink());
  }
}
