import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/tracking_vm.dart';

class BuildCircleWidget extends ConsumerWidget {
  final int index;

  const BuildCircleWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackingVm = ref.watch(trackingVmProvider);
    ref.read(trackingVmProvider);
    bool isActive = index <= trackingVm.currentStep;
    bool isCanceled = trackingVm.isCanceled;

    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: isCanceled && index <= trackingVm.currentStep
            ? Colors.red // Red if canceled and in active range
            : isActive
                ? Colors.orange // Orange for active steps
                : Colors.grey.shade300, // Grey for inactive steps
        shape: BoxShape.circle,
      ),
    );
  }
}
