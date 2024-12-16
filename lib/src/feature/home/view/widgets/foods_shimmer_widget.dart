import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/shimmer_widget.dart';

class FoodsShimmerWidget extends StatelessWidget {
  const FoodsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              7.verticalSpace,
              ShimmerWidget(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.015,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              7.verticalSpace,
              ShimmerWidget(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ],
          ),
          trailing: ShimmerWidget(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
