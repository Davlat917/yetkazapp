import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_savat_page.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/bottom_sheet_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/restaraunt_info_widget.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';

final savatchaVisibleProvider = StateProvider<bool>((ref) => false);

class HomeDetailPage extends ConsumerWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);
    bool isSavatchaVisible = ref.watch(savatchaVisibleProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Pizza",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 300.0,
                          width: double.infinity,
                          child: Image.network(
                            "https://cdn.vox-cdn.com/thumbor/5d_RtADj8ncnVqh-afV3mU-XQv0=/0x0:1600x1067/1200x900/filters:focal(672x406:928x662)/cdn.vox-cdn.com/uploads/chorus_image/image/57698831/51951042270_78ea1e8590_h.7.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.only(top: 150, bottom: 20),
                          child: const RestarauntInfoWidget(),
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      minHeight: 50.0.h,
                      maxHeight: 50.0.h,
                      child: Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 23.h,
                          width: double.maxFinite,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: REdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 30.h,
                                  child: MaterialButton(
                                    height: 5.0.h,
                                    minWidth: 65.w,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    color: Colors.yellow.shade600,
                                    onPressed: () {},
                                    child: Text(
                                      "Donar",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return const BottomSheetWidget();
                        },
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text("${index + 1}"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // "Savatcha" button
          if (isSavatchaVisible)
            Padding(
              padding: REdgeInsets.only(bottom: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade600,
                  minimumSize: Size(double.infinity, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeSavatPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 25.h,
                      width: 25.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "${ctr.count}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    1.verticalSpace,
                    Text(
                      "Savatcha",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      "25 000 so'm",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // const ButtonNavigationBar(),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
