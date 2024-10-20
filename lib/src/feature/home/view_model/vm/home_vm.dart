import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeVmProvider = ChangeNotifierProvider((ref) => HomeVm());

class HomeVm extends ChangeNotifier {
  final List<String> _list = ['1', '1', '1', '1', '1', '1', '1', '1'];
  List<String> get list => _list;

  final List<String> _iconsList = [
    "assets/images/budae-jjigae.png",
    "assets/images/food-serving.png",
  ];

  List<String> get iconsList => _iconsList;

  int count = 1;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    if (count != 1) {
      count--;
    }
    notifyListeners();
  }
}
