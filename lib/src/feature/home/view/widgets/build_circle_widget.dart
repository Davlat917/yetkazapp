import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/feature/home/view_model/vm/slider_vm.dart';

class BuildCircleWidget extends ConsumerWidget {
  final int index;

  const BuildCircleWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrSlider = ref.watch(sliderVmProvider);
    ref.read(sliderVmProvider);
    bool isActive = index <= ctrSlider.currentStep;
    bool isCanceled = ctrSlider.isCanceled;

    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: isCanceled && index <= ctrSlider.currentStep
            ? Colors.red // Red if canceled and in active range
            : isActive
                ? Colors.orange // Orange for active steps
                : Colors.grey.shade300, // Grey for inactive steps
        shape: BoxShape.circle,
      ),
    );
  }
}
