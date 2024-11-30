import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CupertinoElevetedButtonWidget extends StatelessWidget {
  Widget child;
  double? radius;
  void Function() onPressed;

  CupertinoElevetedButtonWidget(
      {super.key, required this.child, required this.onPressed, this.radius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow.shade600,
        minimumSize: Size(double.infinity, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 14),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
