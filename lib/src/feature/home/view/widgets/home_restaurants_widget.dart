import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';

class HomeRestaurantsWidget extends ConsumerWidget {
  final int index;
  const HomeRestaurantsWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctrhome = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: NetworkImage(
                "${ApiConst.baseUrl}${ctrhome.getRestaurantModel!.data!.data![index].uploadPath!.substring(21)}",
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 12,
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: REdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  height: 20.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        "",
                        // "${ApiConst.baseUrl}${ctrhome.getRestaurantModel!.data!.data![index].uploadPath!.substring(21)}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // !isS
                //     ? Align(
                //         alignment: Alignment.topCenter,
                //         child: Container(
                //           child: Center(
                //             child: Text(
                //               'Yopiq',
                //               style: TextStyle(
                //                 fontSize: 20,
                //                 color: Colors.red,
                //                 decoration: TextDecoration.underline,
                //               ),
                //             ),
                //           ),
                //           height: 160.h,
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.vertical(
                //               top: Radius.circular(10.r),
                //             ),
                //             color: Colors.black54,
                //           ),
                //         ),
                //       )
                //     : SizedBox.shrink(),
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
                  "",
                  // ctrhome.getRestaurantModel!.data!.data![index].name.toString(),
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
                          "",
                          // "${ctrhome.getRestaurantModel!.data!.data![index].openTime?.substring(0, 5)} - ${ctrhome.getRestaurantModel!.data!.data![index].closeTime?.substring(0, 5)}",
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
                          "",
                          // "${ctrhome.getRestaurantModel!.data!.data![index].deliverAmount.toString().substring(0, 5)} ${"so'm".tr()}",
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
    );
  }
}
