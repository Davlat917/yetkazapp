import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_buyurtma_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/savat_vm.dart';

class HomeSavatPage extends ConsumerWidget {
  const HomeSavatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctrSavat = ref.read(savatVmProvider);
    ref.watch(savatVmProvider);
    var ctrHome = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ButtonNavigationBar()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text("savatcha".tr()),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: boxFood.length,
                itemBuilder: (context, index) {
                  final itemList = boxFood.values.toList()[index];
                  return Dismissible(
                    key: ValueKey(itemList.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: REdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      ctrSavat.savatDelete(index);
                    },
                    child: ListTile(
                      leading: Image.network("${itemList.uploadPath}"),
                      title: Text(itemList.name!),
                      subtitle: Text("${itemList.price!} ${"so'm".tr()}"),
                      trailing: SizedBox(
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
                                    ctrSavat.decrement(index);
                                  },
                                ),
                                Text("${boxFood.values.toList()[index].count}"),
                                InkWell(
                                  child: const Text("+"),
                                  onTap: () {
                                    ctrSavat.increment(index);
                                  },
                                ),
                              ],
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("jami".tr()),
                    Text(
                      "${ctrSavat.sum} ${"so'm".tr()}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: CupertinoElevetedButtonWidget(
                  onPressed: () async {
                    // await boxFood.delete("food");
                    // await boxFood.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeBuyurtmaPage(),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      "davom etish".tr(),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
