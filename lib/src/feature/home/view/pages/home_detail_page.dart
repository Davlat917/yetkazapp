import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_savat_page.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/bottom_sheet_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/widgets/restaraunt_info_widget.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';

final savatchaVisibleProvider = StateProvider<bool>((ref) => false);
final selectedCategoryIndexProvider =
    StateProvider<int?>((ref) => 0); // Initial index set to 0

class HomeDetailPage extends ConsumerWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);
    bool isSavatchaVisible = ref.watch(savatchaVisibleProvider);
    int? selectedIndex = ref.watch(selectedCategoryIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "pitsa".tr(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
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
                              // bool isSelected = selectedIndex == index;
                              return Padding(
                                padding: REdgeInsets.only(
                                    left: 5, right: 5, top: 5, bottom: 5),
                                child: SizedBox(
                                  height: 10.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      bool isSelected = selectedIndex == index;
                                      return Padding(
                                        padding:
                                            REdgeInsets.only(left: 5, right: 5),
                                        child: SizedBox(
                                          height: 5.h,
                                          child: MaterialButton(
                                            elevation: 0,
                                            height: 10.0.h,
                                            minWidth: 85.w,
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            color: isSelected
                                                ? const Color(0xffffe434)
                                                : const Color(0xfff2f2f2),
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      selectedCategoryIndexProvider
                                                          .notifier)
                                                  .state = index;
                                            },
                                            child: Text(
                                              "donar".tr(),
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
              body: Padding(
                padding: REdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
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
                      child: SizedBox(
                        // height: 100.h,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "pepperoni pitsa".tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "sous, sir, kalbasa".tr(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "59 000 ${"сум".tr()}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            trailing: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: SizedBox(
                                height: 100.h,
                                child: Image.asset(
                                  "assets/images/PLU_WF_LIFESTYLE_Pepperoni_Pizza_READYMEALS.jpg",
                                ),
                              ),
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
                      "savatcha".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      "25 000 ${"so'm".tr()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
