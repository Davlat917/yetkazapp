import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/profile/view_model/vm/profile_vm.dart';

import '../../../../core/widgets/button_widget.dart';
import '../widget/profile_edit_textfield_widget.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  void showDatePicker(BuildContext context, void Function(DateTime) onDateTimeChanged) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 250,
          color: Colors.grey.shade300,
          child: Column(
            children: [
              // Container(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text('done'.tr()),
              //   ),
              // ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: onDateTimeChanged,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.watch(profileVm);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text("infoEdit".tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: ctr.globalKey,
            child: Column(
              children: [
                ProfileEditTextfieldWidget(
                  text: '${"ism".tr()}:',
                  textEditingController: ctr.ismTextEditingController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      ctr.ismTextEditingController.clear();
                      ctr.focusPage(isActive: true);
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Ma'lumotlarni to'ldiring";
                    }
                  },
                  onChanged: ctr.onChanged,
                ),
                20.verticalSpace,
                ProfileEditTextfieldWidget(
                  text: '${"familiya".tr()}:',
                  textEditingController: ctr.familiyaTextEditingController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      ctr.familiyaTextEditingController.clear();
                      ctr.focusPage(isActive: true);
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                  ),
                ),
                20.verticalSpace,
                ProfileEditTextfieldWidget(
                  text: "${"tug'ilgan sana".tr()}:",
                  textEditingController: ctr.sanaTextEditingController,
                  onTap: () {
                    showDatePicker(context, (DateTime newDate) {
                      ctr.sanaTextEditingController.text = "${newDate.day}-${newDate.month}-${newDate.year}";
                      ctr.selectedDate = newDate;
                    });
                  },
                  hintText: ctr.selectedDate != null ? "${ctr.selectedDate!.day}-${ctr.selectedDate!.month}-${ctr.selectedDate!.year}" : "",
                  suffixIcon: IconButton(
                    onPressed: () {
                      ctr.sanaTextEditingController.clear();
                      ctr.focusPage(isActive: true);
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                  ),
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: CupertinoElevetedButtonWidget(
          child: Text(
            "saqlash".tr(),
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            if (ctr.ismTextEditingController.text.isNotEmpty) {
              AppStorage.$write(key: StorageKey.name, value: ctr.ismTextEditingController.text);
              AppStorage.$write(key: StorageKey.lastName, value: ctr.familiyaTextEditingController.text);
              AppStorage.$write(key: StorageKey.date, value: ctr.sanaTextEditingController.text);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ButtonNavigationBar(),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text(
                      "Xatolik".tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Text(
                      "Iltimos ismingizni kiriting".tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "bekor qilish".tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent.shade700,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
      // bottomSheet: ButtonWidget(
      //   text: "saqlash".tr(),
      //   onPressed: () {
      //     if (ctr.globalKey.currentState?.validate() ?? false) {
      //       // Save data to storage
      //       AppStorage.$write(key: StorageKey.name, value: ctr.ismTextEditingController.text);
      //       AppStorage.$write(key: StorageKey.lastName, value: ctr.familiyaTextEditingController.text);
      //       AppStorage.$write(key: StorageKey.date, value: ctr.sanaTextEditingController.text);
      //
      //       // Navigate to Bottom Navigation Bar
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const ButtonNavigationBar(),
      //         ),
      //       );
      //     } else {
      //       // Show error or alert if needed
      //     }
      //   },
      // ),
    );
  }
}
