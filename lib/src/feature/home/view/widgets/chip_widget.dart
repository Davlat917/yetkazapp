import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipWidget extends StatelessWidget {
  String label;
  ChipWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: 10.h,
        child: Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
          label: Text(
            label,
          ),
          backgroundColor: Colors.yellow.shade600,
        ),
      ),
    );
  }
}
