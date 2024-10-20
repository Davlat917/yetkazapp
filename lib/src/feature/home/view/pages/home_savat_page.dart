import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_buyurtma_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/home_vm.dart';

class HomeSavatPage extends ConsumerWidget {
  const HomeSavatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(homeVmProvider);
    ref.watch(homeVmProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Savatcha"),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: "Edit", onPressed: (BuildContext context) {},
                    // onPressed: (value) {
                    //   final upDateName = TextEditingController(text: ctr.postList[index].name);
                    //   final upDateNumber = TextEditingController(text: ctr.postList[index].number);
                    //   showDialog(
                    //     context: context,
                    //     builder: (contex) {
                    //       return CustomDialogW(
                    //         nameControllerr: upDateName,
                    //         numberControllerr: upDateNumber,
                    //         onPressed: () {
                    //           var info = ContactsModel(
                    //             name: upDateName.text,
                    //             number: upDateNumber.text,
                    //           );
                    //           ctr.updateData(info, ctr.postList[index].id);
                    //           Navigator.pop(context);
                    //         },
                    //       );
                    //     },
                    //   );
                    // },
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/PLU_WF_LIFESTYLE_Pepperoni_Pizza_READYMEALS-removebg-preview.png",
                    width: 60.h,
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
            ),
            500.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Jami"),
                Text("25 000 so'm"),
              ],
            ),
            CupertinoElevetedButtonWidget(
              child: Text(
                "Davom etish",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeBuyurtmaPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
