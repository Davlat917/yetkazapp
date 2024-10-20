import 'package:flutter/material.dart';

class CustomCheckboxWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCheckboxWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.orange.shade200,
            width: 3,
          ),
          color: isSelected ? Colors.orange : Colors.transparent,
        ),
      ),
    );
  }
}
