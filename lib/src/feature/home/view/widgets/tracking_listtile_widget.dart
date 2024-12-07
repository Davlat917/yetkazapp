import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackingListTileWidget extends StatelessWidget {
  final String leading;
  final String trailing;

  const TrackingListTileWidget({super.key, required this.leading, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListTile(
        leading: Text(
          leading.tr(),
          style: TextStyle(fontSize: 14.sp),
        ),
        trailing: Text(
          trailing.tr(),
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
