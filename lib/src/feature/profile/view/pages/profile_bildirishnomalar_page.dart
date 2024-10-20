import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/profile_bildirishnomalar_widget.dart';

class ProfileBildirishnomalarPage extends StatelessWidget {
  const ProfileBildirishnomalarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirishnomalar"),
        backgroundColor: Colors.yellow.shade600,
        centerTitle: false,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: const ProfileBildirishnomalarWidget(),
      ),
    );
  }
}
