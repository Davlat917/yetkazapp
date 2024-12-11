import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_successfully_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/savat_vm.dart';
import 'package:tezyetkazz/src/feature/map/view/page/yandex_page.dart';
import 'package:tezyetkazz/src/feature/map/view_model/vm/geocoding_func.dart';
import 'package:tezyetkazz/src/feature/map/view_model/vm/yandex_vm.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomeBuyurtmaPage extends ConsumerWidget {
  const HomeBuyurtmaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctrSavat = ref.read(savatVmProvider);
    ref.watch(savatVmProvider);
    var ctrYandex = ref.read(yandexVmProvider);
    ref.watch(yandexVmProvider);

    // String deliverAmount = "${AppStorage.$read(key: StorageKey.deliverAmount)}";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("yangi buyurtma".tr()),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "yetkazish manzili".tr(),
                style: TextStyle(fontSize: 18.sp),
              ),
              InkWell(
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
                    ctrYandex.locationSet(newLocationName);
                    // Log to confirm the provider updated
                    print("Updated location name: ${ctrYandex.myLocationName}");
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.yellow.shade600,
                    ),
                    Flexible(
                      child: Text(
                        ctrYandex.myLocationName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.location_on,
              //     color: Colors.yellow.shade600,
              //   ),
              //   subtitle: Padding(
              //     padding: const EdgeInsets.only(bottom: 5),
              //     child: const Text("Bayovut tumani, Guliston shahar"),
              //   ),
              //   trailing: IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.navigate_next),
              //   ),
              // ),
              Row(
                children: [
                  MaterialButton(
                    elevation: 0,
                    minWidth: 290.w,
                    height: 35.h,
                    color: Colors.yellow.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    onPressed: () async {
                      final selectedLocation = await Navigator.push<Point>(
                        context,
                        MaterialPageRoute(builder: (_) => const CustomYandexMap()),
                      );
                      if (selectedLocation != null) {
                        // Log the selected location to verify
                        print("Received location in HomePage: $selectedLocation");
                        // Fetch the location name and update provider
                        final newLocationName = await getAddressFromLatLong(
                          selectedLocation.latitude,
                          selectedLocation.longitude,
                        );
                        ctrYandex.locationSet(newLocationName);
                        // Log to confirm the provider updated
                        print("Updated location name: ${ctrYandex.myLocationName}");
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.done),
                        Text("myLocation".tr()),
                      ],
                    ),
                  ),
                  15.horizontalSpace,
                  SizedBox(
                    width: 46.w,
                    child: MaterialButton(
                      elevation: 0,
                      // minWidth: 30.w,
                      height: 35.h,
                      color: Colors.red.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              15.verticalSpace,
              Text(
                "to'lov usuli".tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              15.verticalSpace,
              MaterialButton(
                elevation: 0,
                minWidth: 90.w,
                height: 35.h,
                color: Colors.yellow.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                onPressed: () {},
                child: Text(
                  "naqd".tr(),
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ),
              15.verticalSpace,
              Column(
                children: List.generate(boxFood.length, (index) {
                  final itemList = boxFood.values.toList()[index];
                  return Slidable(
                    // startActionPane: ActionPane(
                    //   motion: const ScrollMotion(), // You can use other motions like DrawerMotion
                    //   dismissible: DismissiblePane(
                    //     onDismissed: () {
                    //       ctrSavat.savatDelete(index);
                    //     },
                    //   ),
                    //   children: [
                    //     SlidableAction(
                    //       onPressed: (context) {
                    //         ctrSavat.decrement(index);
                    //       },
                    //       backgroundColor: Colors.blue,
                    //       foregroundColor: Colors.white,
                    //       icon: Icons.remove,
                    //     ),
                    //   ],
                    // ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            ctrSavat.savatDelete(index);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.network(itemList.uploadPath ?? ''),
                      title: Text(itemList.name ?? ''),
                      // title: Text("${AppStorage.$write(key: StorageKey.name, value: itemList.name.toString())}"),
                      subtitle: Text("${itemList.price ?? 0} ${"so'm".tr()}"),
                      trailing: SizedBox(
                        height: 25.h,
                        width: 80.w,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: REdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: const Text("-"),
                                  onTap: () {
                                    ctrSavat.decrement(index);
                                  },
                                ),
                                Text("${itemList.count ?? 0}"),
                                InkWell(
                                  child: const Text("+"),
                                  onTap: () {
                                    ctrSavat.increment(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              15.verticalSpace,
              Text(
                "to'lov usuli".tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              15.verticalSpace,
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "price".tr(),
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    "${ctrSavat.sum} ${"so'm".tr()}",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "yetkazish narxi".tr(),
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    "${ctrSavat.deliverAmount.substring(0, 5)} ${"so'm".tr()}",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              const Divider(),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "jami".tr(),
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    "${int.parse(ctrSavat.deliverAmount.substring(0, 5)) + ctrSavat.sum} ${"so'm".tr()}",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              CupertinoElevetedButtonWidget(
                child: Text(
                  "buyurtma berish".tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
                onPressed: () {
                  ctrSavat.postOrderVm();
                  AppStorage.$write(key: StorageKey.foodsAmount, value: ctrSavat.sum.toString());
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeSuccessfullyPage(),
                    ),
                    ModalRoute.withName("/"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
