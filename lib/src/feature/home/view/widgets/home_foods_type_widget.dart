import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/vm/home_vm.dart';

// State provider to manage the selected index
final selectedFoodTypeProvider = StateProvider<int?>((ref) => null);

class HomeFoodsTypeWidget extends ConsumerWidget {
  const HomeFoodsTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);

    // Watch the selected index provider
    final selectedIndex = ref.watch(selectedFoodTypeProvider);

    return SizedBox(
      height: 115.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ctr.listHeadCategoryModel?.length,
        itemBuilder: (context, index) {
          // Check if the current index is selected
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              // Update the selected index
              ref.read(selectedFoodTypeProvider.notifier).state = isSelected ? null : index;
            },
            child: Column(
              children: [
                15.verticalSpace, // Space for top
                Container(
                  margin: REdgeInsets.symmetric(horizontal: 5),
                  // height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: 65.h,
                  // width: 70.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffff7c04),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.sp),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.network(
                      "${ctr.listHeadCategoryModel?[index].photo}",
                      // fit: BoxFit.cover,
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                Text(
                  "${ctr.listHeadCategoryModel?[index].name}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
