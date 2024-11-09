import 'package:flutter/material.dart';

class ProfileCategoryWidget2 extends StatelessWidget {
  final Widget icon;
  final String text;
  final void Function() onTap;

  const ProfileCategoryWidget2({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: Colors.yellow.shade600,
            child: icon,
          ),
          title: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(
          indent: 15,
          endIndent: 25,
        ),
      ],
    );
  }
}
