import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final successlufllyProvider = ChangeNotifierProvider((ref) => SuccesslufllyVm());

class SuccesslufllyVm extends ChangeNotifier {
  SuccesslufllyVm();
}
