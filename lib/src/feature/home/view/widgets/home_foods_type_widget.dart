import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/vm/home_vm.dart';

class HomeFoodsTypeWidget extends ConsumerWidget {
  const HomeFoodsTypeWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var ctr = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);
    return SizedBox(
      height: 115.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: ref.watch(homeVmProvider).list.length,
        itemCount: ctr.list.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              /// space for top
              15.verticalSpace,
              Container(
                margin: REdgeInsets.only(left: 5, right: 5),
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.sp),
                  ),
                ),
                child: Image.asset(
                  "assets/images/budae-jjigae.png",
                  scale: 2,
                ),
              ),
              const Text(
                "Milliy",
                style: TextStyle(color: Colors.black),
              ),
            ],
          );
        },
      ),
    );
  }
}

// /Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
