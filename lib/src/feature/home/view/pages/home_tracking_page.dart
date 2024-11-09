import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/build_circle_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/build_line_widget.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/tracking_vm.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTrackingPage extends ConsumerWidget {
  final List<String> steps = ['qabul qilindi'.tr(), 'tayyorlanmoqda'.tr(), "yo'lda".tr(), 'yetkazildi'.tr()];
  final int currentStep = 0;

  HomeTrackingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);
    var ctrTracking = ref.read(trackingVmProvider);
    ref.watch(trackingVmProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ButtonNavigationBar(),
              ),
              ModalRoute.withName('/'),
            );
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: REdgeInsets.only(right: 15, top: 10),
            child: Column(
              children: [
                ctr.bekor == false
                    ? Text(
                        "bekor qilingan".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.red.shade700,
                        ),
                      )
                    : const SizedBox.shrink(),
                5.verticalSpace,
                ctr.bekor == false
                    ? Text(
                        "17.10.24 19:08",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.red.shade700,
                          fontSize: 12.sp,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"buyurtma raqami".tr()}: No 123456",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
                ctr.bekor == false
                    ? Text(
                        "${"sababi".tr()}: ${"noma'lum".tr()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.red.shade700,
                          fontSize: 12.sp,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Custom progress indicator
                  // Row(
                  //   children: List.generate(steps.length * 2 - 1, (index) {
                  //     if (index % 2 == 0) {
                  //       // Circle indicator
                  //       int stepIndex = index ~/ 2;
                  //       bool isActive = stepIndex <= currentStep;
                  //       // return _buildCircle(isActive);
                  //       return BuildCircleWidget(index: index, isActive: ctr.qabul);
                  //     } else {
                  //       // Connecting line
                  //       bool isActive = index ~/ 2 < currentStep;
                  //       return _buildLine(isActive);
                  //     }
                  //   }),
                  // ),
                  Row(
                    children: List.generate(steps.length * 2 - 1, (index) {
                      if (index % 2 == 0) {
                        return BuildCircleWidget(index: index ~/ 2);
                      } else {
                        // bool isActive = index ~/ 2 < ctrTracking.currentStep;
                        return BuildLineWidget(index: index ~/ 1.5);
                      }
                    }),
                  ),
                  const SizedBox(height: 16.0),
                  // Step labels
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: steps
                        .map(
                          (label) => Text(
                            label,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10.h,
              thickness: 2,
            ),
            10.verticalSpace,
            Center(
              child: Text(
                "Bosco",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("x1    Kukurella"),
                Text("54 000 ${"so'm".tr()}"),
              ],
            ),
            10.verticalSpace,
            Divider(
              height: 10.h,
              thickness: 2,
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("to'lov usuli".tr()),
                Text("naqd".tr()),
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("price".tr()),
                Text("54 000 ${"so'm".tr()}"),
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("yetkazish narxi".tr()),
                Text("16 000 ${"so'm".tr()}"),
              ],
            ),
            10.verticalSpace,
            Divider(
              height: 10.h,
              thickness: 2,
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "jami".tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "16 000 ${"so'm".tr()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            CupertinoElevetedButtonWidget(
              child: Text(
                "operator bilan bog'lanish".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              ),
              onPressed: () async {
                final Uri url = Uri(
                  scheme: "tel",
                  path: "+998992173126",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  debugPrint("Cannot not found");
                }
              },
            ),
            20.verticalSpace,
            ctrTracking.currentStep < 2 && ctr.bekor
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(double.infinity, 55.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(
                              "buyurtmani bekor qilish".tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            content: Text(
                              "siz rostdan ham buyurtmani bekor qilmoqchimisiz".tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "yoq".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueAccent.shade700,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  ctr.buyurtmaBekor(false);
                                  ctrTracking.cancelOrder();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      backgroundColor: const Color(0xff98bc4c),
                                      content: Center(
                                        child: Text(
                                          "buyurtma bekor qilindi".tr(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "ha".tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "buyurtmani bekor qilish".tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
