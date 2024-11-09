import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tezyetkazz/app.dart';

class AppBarWidget extends StatelessWidget {
  final String locationAddress;

  const AppBarWidget({super.key, required this.locationAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "yetkazib ber".tr(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ],
        ),
        Text(
          locationAddress,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black26),
        ),
      ],
    );
  }
}
