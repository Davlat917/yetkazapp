import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_successfully_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';

class HomeBuyurtmaPage extends ConsumerWidget {
  const HomeBuyurtmaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangi buyurtma"),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yetkazish manzili",
              style: TextStyle(fontSize: 18.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.yellow.shade600,
                ),
                const Text("Bayovut tumani, Guliston shahar"),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  minWidth: 290.w,
                  height: 35.h,
                  color: Colors.yellow.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.done),
                      Text("Men turgan joyga yetkazish"),
                    ],
                  ),
                ),
                15.horizontalSpace,
                SizedBox(
                  width: 46.w,
                  child: MaterialButton(
                    // minWidth: 30.w,
                    height: 35.h,
                    color: Colors.red.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            Text(
              "To'lov usuli",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            15.verticalSpace,
            MaterialButton(
              minWidth: 90.w,
              height: 35.h,
              color: Colors.yellow.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              onPressed: () {},
              child: Text(
                "Naqd",
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/PLU_WF_LIFESTYLE_Pepperoni_Pizza_READYMEALS-removebg-preview.png",
                  width: 80.h,
                ),
                SizedBox(
                  height: 25.h,
                  width: 80.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: const Text("-"),
                            onTap: () {
                              ctr.decrement();
                            },
                          ),
                          Text("${ctr.count}"),
                          InkWell(
                            child: const Text("+"),
                            onTap: () {
                              ctr.increment();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Pizza",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "25 000 so'm",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            Text(
              "Qo'shimcha ma'lumot",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            15.verticalSpace,
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mahsulotlar narxi",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  "25 000 so'm",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Yetkazish narxi",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  "18 000 so'm",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            const Divider(),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jami",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  "43 000 so'm",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            CupertinoElevetedButtonWidget(
              child: Text(
                "Buyurtma berish",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeSuccessfullyPage(),
                  ),
                  ModalRoute.withName("/"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
