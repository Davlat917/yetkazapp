import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/feature/profile/view_model/vm/profile_vm.dart';

class ProfileBildirishnomalarWidget extends ConsumerWidget {
  const ProfileBildirishnomalarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(profileVm);
    ref.watch(profileVm);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Buyurtma haqida ilovada\nbildirishnoma olish",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            CupertinoSwitch(
              value: ctr.isAppNotificationOn,
              onChanged: (value) {
                ctr.appNotification(value);
              },
              activeColor: Colors.orange,
              trackColor: Colors.grey.shade300,
            ),
          ],
        ),
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Buyurtma haqida Telegram botda\nbildirishnoma olish",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            10.horizontalSpace,
            CupertinoSwitch(
              value: ctr.isTelegramNotificationOn,
              onChanged: (value) {
                ctr.telegramNotification(value);
              },
              activeColor: Colors.orange,
              trackColor: Colors.grey.shade300,
            ),
          ],
        ),
      ],
    );
  }
}
