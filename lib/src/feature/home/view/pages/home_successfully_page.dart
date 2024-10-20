import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_tracking_page.dart';

class HomeSuccessfullyPage extends StatelessWidget {
  const HomeSuccessfullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buyurtma qabul qilindi"),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Lottie.asset(
                "assets/lottie/Animation - 1729172546029.json",
                width: 300.w,
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 100),
              child: CupertinoElevetedButtonWidget(
                child: Text(
                  "Buyurtmani kuzatish",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeTrackingPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
