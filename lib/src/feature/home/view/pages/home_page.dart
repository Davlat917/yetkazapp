import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_detail_page.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/app_bar_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/home_foods_type_widget.dart';
import 'package:tezyetkazz/src/feature/map/view/page/yandex_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Color yellowColor = const Color(0xffFFE030);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowColor,
      appBar: AppBar(
        backgroundColor: yellowColor,
        toolbarHeight: 50,
        title: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const CustomYandexMap()));
          },
          child: const AppBarWidget(),
        ),
      ),
      body: Column(
        children: [
          const HomeFoodsTypeWidget(),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(22.sp))),
              child: Column(
                children: [
                  10.verticalSpace,
                  Text(
                    "Barchasi",
                    style: TextStyle(color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          /// Restaurants
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeDetailPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 240.h,
                              width: double.infinity,
                              margin: REdgeInsets.only(
                                top: 7,
                                bottom: 10,
                                right: 2,
                                left: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2),
                                ],
                              ),

                              /// all parts of the restaurant widget
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 160.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                              "https://cdn.vox-cdn.com/thumbor/5d_RtADj8ncnVqh-afV3mU-XQv0=/0x0:1600x1067/1200x900/filters:focal(672x406:928x662)/cdn.vox-cdn.com/uploads/chorus_image/image/57698831/51951042270_78ea1e8590_h.7.jpg",
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 92.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.r),
                                        bottomRight: Radius.circular(10.r),
                                        topLeft: Radius.circular(15.r),
                                        topRight: Radius.circular(15.r),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Uchrashuv bekati",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey.shade300,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            /// ish vaqti
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Ish vaqti",
                                                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                                                ),
                                                Text(
                                                  "09:00 - 03:00",
                                                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 1.w,
                                              height: 40.h,
                                              color: Colors.grey.shade300,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Yetkazish",
                                                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                                                ),
                                                Text(
                                                  "11 000 som",
                                                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
