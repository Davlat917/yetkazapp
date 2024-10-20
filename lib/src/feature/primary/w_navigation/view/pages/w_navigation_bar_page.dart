import 'package:flutter/material.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_page.dart';
import 'package:tezyetkazz/src/feature/orders/view/pages/orders_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_page.dart';
import 'package:tezyetkazz/src/feature/search/view/pages/search_page.dart';

class WNavigationBarPage extends StatefulWidget {
  const WNavigationBarPage({super.key});

  @override
  State<WNavigationBarPage> createState() => _WNavigationBarPageState();
}

class _WNavigationBarPageState extends State<WNavigationBarPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SearchPage(),
    OrdersPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [_widgetOptions[_selectedIndex]],
      ),
    );
  }
}
