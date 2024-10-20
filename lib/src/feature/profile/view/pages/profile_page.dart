import 'package:flutter/material.dart';
import '../widget/profile_category_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.yellow.shade600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75, // adjust height
              width: double.infinity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                  child: SingleChildScrollView(
                    child: ProfileCategoryWidget(),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.68),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 61,
                  backgroundColor: Colors.grey.shade200,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0.85, -0.55),
            child: GestureDetector(
              child: Image.asset(
                'assets/images/arrow.png',
                width: 25,
                color: Colors.grey,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, MediaQuery.of(context).size.width * -0.0009),
            child: const Text(
              'Asliddin',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, MediaQuery.of(context).size.width * -0.0007),
            child: const Text(
              '+998994646057',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
