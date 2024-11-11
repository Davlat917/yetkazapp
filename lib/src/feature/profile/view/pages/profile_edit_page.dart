import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/feature/profile/view_model/vm/profile_vm.dart';
import '../../../../core/widgets/button_widget.dart';
import '../widget/profile_edit_textfield_widget.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  void _showDatePicker(BuildContext context, void Function(DateTime) onDateTimeChanged) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('done'.tr()),
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  // onDateTimeChanged: (DateTime newDate) {
                  //     selectedDate = newDate;
                  // },
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
    ref.read(profileVm);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text("infoEdit".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ProfileEditTextfieldWidget(text: '${"ism".tr()}:', textEditingController: ctr.ismTextEditingController),
            20.verticalSpace,
            ProfileEditTextfieldWidget(text: '${"familiya".tr()}:', textEditingController: ctr.familiyaTextEditingController),
            20.verticalSpace,
            ProfileEditTextfieldWidget(
              text: "${"tug'ilgan sana".tr()}:",
              textEditingController: ctr.sanaTextEditingController,
              // onTap: () => _showDatePicker(context),
              hintText: ctr.selectedDate != null ? "${ctr.selectedDate!.day}-${ctr.selectedDate!.month}-${ctr.selectedDate!.year}" : "",
            ),
            30.verticalSpace,
            ButtonWidget(
              text: "saqlash".tr(),
              onPressed: () {
                AppStorage.$write(key: StorageKey.name, value: ctr.ismTextEditingController.text);
                AppStorage.$write(key: StorageKey.lastName, value: ctr.familiyaTextEditingController.text);
                AppStorage.$write(key: StorageKey.date, value: ctr.sanaTextEditingController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
// git push
