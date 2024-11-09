import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/vm/orders_vm.dart';

class OrdersBottomSheetWidget extends ConsumerWidget {
  const OrdersBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(ordersVm);
    ref.watch(ordersVm);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ButtonNavigationBar(),
            //   ),
            //   ModalRoute.withName('/'),
            // );
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: REdgeInsets.only(right: 15, top: 10),
            child: Column(
              children: [
                Text(
                  "Bekor qilingan",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.red.shade700,
                  ),
                ),
                5.verticalSpace,
                Text(
                  "17.10.24 19:08",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade700,
                    fontSize: 12.sp,
                  ),
                ),
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
                  "Buyurtma raqami: No 123456",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  "Sababi: Noma'lum",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.red.shade700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Custom progress indicator
                  Row(
                    children: List.generate(ctr.steps.length * 2 - 1, (index) {
                      if (index % 2 == 0) {
                        // Circle indicator
                        int stepIndex = index ~/ 2;
                        bool isActive = stepIndex <= ctr.currentStep;
                        return _buildCircle(isActive);
                      } else {
                        // Connecting line
                        bool isActive = index ~/ 2 < ctr.currentStep;
                        return _buildLine(isActive);
                      }
                    }),
                  ),
                  const SizedBox(height: 16.0),
                  // Step labels
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ctr.steps
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("x1    Kukurella"),
                Text("54 000 so'm"),
              ],
            ),
            10.verticalSpace,
            Divider(
              height: 10.h,
              thickness: 2,
            ),
            20.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To'lov usuli"),
                Text("Naqd pul"),
              ],
            ),
            10.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mahsulotlar narxi"),
                Text("54 000 so'm"),
              ],
            ),
            10.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Yetkazish narxi"),
                Text("16 000 so'm"),
              ],
            ),
            10.verticalSpace,
            Divider(
              height: 10.h,
              thickness: 2,
            ),
            10.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jami",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "16 000 so'm",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            CupertinoElevetedButtonWidget(
              child: Text(
                "Operator bilan bog'lanish",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              ),
              onPressed: () {},
            ),
            20.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 55.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                // ctr.buyurtmaBekor(false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    backgroundColor: Color(0xff98bc4c),
                    content: Center(
                      child: Text(
                        "Buyurtma bekor qilindi",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "Buyurtmani bekor qilish",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCircle(bool isActive) {
  return Container(
    width: 24.0,
    height: 24.0,
    decoration: BoxDecoration(
      color: isActive ? Colors.orange : Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
  );
}

Widget _buildLine(bool isActive) {
  return Expanded(
    child: Container(
      height: 4.0,
      color: isActive ? Colors.orange : Colors.grey.shade300,
    ),
  );
}
