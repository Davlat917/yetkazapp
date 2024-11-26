import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/chip_widget.dart';

class RestarauntInfoWidget extends StatelessWidget {
  final String restaurantName;
  final String restaurantDate;

  const RestarauntInfoWidget({super.key, required this.restaurantName, required this.restaurantDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.h,
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          15.verticalSpace,
          Text(
            restaurantName,
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text("BEST FOOD"),
          5.verticalSpace,
          SizedBox(
            height: 35.h,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ChipWidget(label: "Milliy");
              },
            ),
          ),
          5.verticalSpace,
          Text("naqd".tr()),
          Divider(
            color: Colors.grey.shade300,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              1.horizontalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ish vaqti".tr(),
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  Text(
                    restaurantDate,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "yetkazish".tr(),
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  Text(
                    "11 000 som",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ],
              ),
              10.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
