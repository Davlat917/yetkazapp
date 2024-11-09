import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_add_card_page.dart';

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.yellow.shade600,
        title: Text("myCards".tr()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileAddCardPage(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/2024-07-21 05.18.47.jpg',
                width: MediaQuery.of(context).size.width * 0.95,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
