import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
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
        itemCount: ctr.categoryGetByRestaurantModel!.data!.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Column(
            children: [
              15.verticalSpace,
              GestureDetector(
                onTap: () {
                  if (isSelected) {
                    ref.read(selectedFoodTypeProvider.notifier).state = null; // Reset to default
                    ctr.getCategoryName(name: "Barchasi");
                    ctr.getAllRestaurant(page: 0);
                  } else {
                    ref.read(selectedFoodTypeProvider.notifier).state = index; // Select new category
                    ctr.getCategoryName(name: ctr.categoryGetByRestaurantModel!.data![index].name.toString());
                    ctr.getRestaurantCategoryId(page: 0, categoryId: ctr.categoryGetByRestaurantModel!.data![index].id.toString());
                  }
                },
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 5),
                  child: Container(
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
                      child: Center(
                        child: Image.network(
                          "${ApiConst.baseUrl}${ctr.categoryGetByRestaurantModel?.data?[index].uploadPath!.substring(21)}",
                          // fit: BoxFit.cover,
                          color: isSelected ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "${ctr.categoryGetByRestaurantModel?.data?[index].name}",
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
            ],
          );
        },
      ),
    );
  }
}
