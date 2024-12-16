import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/shimmer_widget.dart';

class HomeRestaurantShimmerWidget extends StatelessWidget {
  const HomeRestaurantShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShimmerWidget(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            // height: 240.h,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 12,
                )
              ],
            ),
            child: Column(
              children: [
                ShimmerWidget(
                  child: Container(
                    margin: REdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    height: 20.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShimmerWidget(
                            child: Container(
                              height: 20.h,
                              width: MediaQuery.of(context).size.width * 0.28,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                          ),
                          // SizedBox(height: 8.h),
                          8.verticalSpace,
                          ShimmerWidget(
                            child: Container(
                              height: 20.h,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 20.horizontalSpace,
                      Container(
                        width: 1.w,
                        height: 40.h,
                        color: Colors.grey.shade300,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShimmerWidget(
                            child: Container(
                              height: 20.h,
                              width: MediaQuery.of(context).size.width * 0.28,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          ShimmerWidget(
                            child: Container(
                              height: 20.h,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
