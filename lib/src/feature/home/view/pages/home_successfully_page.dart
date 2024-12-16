import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_tracking_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/successfully_vm.dart';

class HomeSuccessfullyPage extends ConsumerWidget {
  final String orderId;
  final String jami;
  final String yetkazish;
  final String mahsulot;
  final String restaurantName;

  const HomeSuccessfullyPage({
    super.key,
    required this.orderId,
    required this.jami,
    required this.mahsulot,
    required this.yetkazish,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.watch(successlufllyProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("buyurtma qabul qilindi".tr()),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: ctr.activeLottie ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500), // fade-out duration
                    child: Lottie.asset(
                      "assets/lottie/Animation - 1729172546029.json",
                      width: 300.w,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: ctr.activeLottie ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500), // fade-in duration
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 15),
                      child: Image.asset(
                        "assets/images/Снимок_экрана_2024-10-30_в_05.40.39-removebg-preview.png",
                        width: 300.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CupertinoElevetedButtonWidget(
          child: Text(
            "buyurtmani kuzatish".tr(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeTrackingPage(
                  orderPage: false,
                  orderId: orderId,
                  jami: jami,
                  yetkazish: yetkazish,
                  mahsulot: mahsulot,
                  restaurantName: restaurantName,
                ),
              ),
              (context) => false,
            );
          },
        ),
      ),
    );
  }
}
