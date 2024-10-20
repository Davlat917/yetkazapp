import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';

class HomeTrackingPage extends StatelessWidget {
  final List<String> steps = ['Qabul qilindi', 'Tayyorlanmoqda', 'Yo\'lda', 'Yetkazildi'];
  final int currentStep = 0;

  HomeTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Buyurtma raqami: No 123456",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Custom progress indicator
                  Row(
                    children: List.generate(steps.length * 2 - 1, (index) {
                      if (index % 2 == 0) {
                        // Circle indicator
                        int stepIndex = index ~/ 2;
                        bool isActive = stepIndex <= currentStep;
                        return _buildCircle(isActive);
                      } else {
                        // Connecting line
                        bool isActive = index ~/ 2 < currentStep;
                        return _buildLine(isActive);
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
              onPressed: () {},
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
