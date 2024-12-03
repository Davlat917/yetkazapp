import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_detail_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_detail_vm.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';

class BottomSheetWidget extends ConsumerWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeDetailVmProvider);
    ref.watch(homeDetailVmProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/PLU_WF_LIFESTYLE_Pepperoni_Pizza_READYMEALS-removebg-preview.png",
              // width: 250.w,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          20.verticalSpace,
          Text(
            "pepperoni pitsa".tr(),
            style: TextStyle(
              fontSize: 22.sp,
            ),
          ),
          Text("tayyorlanish".tr()),
          40.verticalSpace,
          Center(
            child: SizedBox(
              height: 50.h,
              width: 150.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        minWidth: 40.w,
                        height: 40.h,
                        color: Colors.grey.shade400,
                        onPressed: () {
                          ctr.decrement();
                        },
                        child: const Text("-"),
                      ),
                      Text("${ctr.count}"),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        minWidth: 40.w,
                        height: 40.h,
                        color: Colors.yellow.shade600,
                        onPressed: () {
                          ctr.increment();
                        },
                        child: const Text("+"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          CupertinoElevetedButtonWidget(
            onPressed: () {
              ref.read(savatchaVisibleProvider.notifier).state = true;
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "addsavat".tr(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "25.000 ${"so'm".tr()}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
