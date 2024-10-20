import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersVm = ChangeNotifierProvider((ref) => LoginVm());

class LoginVm extends ChangeNotifier {
  final List<Map<String, String>> ordersList = [
    {
      'title': 'Uchrashuv bekat 24/7',
      'price': '59 000 so\'m',
      'time': '17.07.2024 01:07',
      'status': 'Bekor qilingan',
    },
    {
      'title': 'Uchrashuv bekat 24/7',
      'price': '59 000 so\'m',
      'time': '17.07.2024 01:05',
      'status': 'Bekor qilingan',
    },
    {
      'title': 'Uchrashuv bekat 24/7',
      'price': '59 000 so\'m',
      'time': '17.07.2024 01:04',
      'status': 'Bekor qilingan',
    },
  ];
}
