import 'package:flutter/material.dart';

class OrderProgress extends StatelessWidget {
  final List<String> steps = ['Qabul qilindi', 'Tayyorlanmoqda', 'Yo\'lda', 'Yetkazildi'];
  final int currentStep = 0;

  OrderProgress({super.key}); // Change this to update the progress (0 to 3)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length, (index) {
          return buildStep(index, context);
        }),
      ),
    );
  }

  Widget buildStep(int index, BuildContext context) {
    bool isActive = index <= currentStep;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Circle to indicate progress
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.orange : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 8.0),
        // Step label
        Text(
          steps[index],
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
        // Horizontal line to connect the steps
        if (index < steps.length - 1)
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 4.0),
              height: 2.0,
              color: isActive ? Colors.orange : Colors.grey,
            ),
          ),
      ],
    );
  }
}
