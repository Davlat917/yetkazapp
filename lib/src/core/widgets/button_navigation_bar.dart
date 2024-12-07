import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/feature/auth/view/pages/auth_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_page1.dart';

import '../../feature/home/view/pages/home_page.dart';
import '../../feature/orders/view/pages/orders_page.dart';
import '../../feature/search/view/pages/search_page.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({super.key});

  @override
  _ButtonNavigationBarState createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  int _selectedIndex = 0;

  bool a = false;

  Future<void> okToken() async {
    String? yesToken = await AppStorage.$read(key: StorageKey.accessToken);
    if (yesToken != null && yesToken != "") {
      log("Token ============ $yesToken");
      a = true;
    } else {
      log("Token ============ $yesToken");
      a = false;
    }
  }

  @override
  void initState() {
    okToken();
  }

  static final List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    SearchPage(),
    AuthPage(),
    AuthPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    widgetOptions[3] = a ? const ProfilePage1() : AuthPage();
    widgetOptions[2] = a ? const OrdersPage() : AuthPage();

    return Scaffold(
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent, // Disable highlight effect on tap
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow.shade700,
          unselectedItemColor: Colors.grey.shade400,
          selectedFontSize: 12, // Set the font size to be the same
          unselectedFontSize: 12, // Prevents animation on label text
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Снимок_экрана_2024-10-30_в_02.33.03-removebg-preview.png",
                width: 40.w,
                height: 40.h,
                color: _selectedIndex == 0 ? Colors.yellow.shade700 : Colors.grey.shade400,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: REdgeInsets.only(top: 7),
                child: Image.asset(
                  "assets/images/search.png",
                  width: 33.w,
                  height: 33.h,
                  color: _selectedIndex == 1 ? Colors.yellow.shade700 : Colors.grey.shade400,
                ),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Снимок_экрана_2024-10-30_в_02.56.30-removebg-preview.png",
                width: 40.w,
                height: 40.h,
                color: _selectedIndex == 2 ? Colors.yellow.shade700 : Colors.grey.shade400,
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Снимок_экрана_2024-10-30_в_03.01.24-removebg-preview.png",
                width: 40.w,
                height: 40.h,
                color: _selectedIndex == 3 ? Colors.yellow.shade700 : Colors.grey.shade400,
              ),
              label: "Profile",
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
