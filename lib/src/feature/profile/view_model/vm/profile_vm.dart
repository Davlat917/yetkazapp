import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileVm = ChangeNotifierProvider((ref) => ProfileVm());

enum Language { uzbek, russian }

class ProfileVm extends ChangeNotifier {
  Language? selectedLanguage;

  bool isAppNotificationOn = false;
  bool isTelegramNotificationOn = false;

  void selectLanguage(Language language) {
    selectedLanguage = language;
    notifyListeners(); // This triggers the UI to update
  }

  void appNotification(bool value) {
    isAppNotificationOn = value;
    notifyListeners();
  }

  void telegramNotification(bool value) {
    isTelegramNotificationOn = value;
    notifyListeners();
  }
}
