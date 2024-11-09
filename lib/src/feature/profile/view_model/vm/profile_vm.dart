import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';

final profileVm = ChangeNotifierProvider((ref) => ProfileVm());

enum Language { uzbek, russian }

class ProfileVm extends ChangeNotifier {
  Language? selectedLanguage;

  bool isAppNotificationOn = false;
  bool isTelegramNotificationOn = false;

  TextEditingController ismTextEditingController = TextEditingController();
  TextEditingController familiyaTextEditingController = TextEditingController();
  TextEditingController sanaTextEditingController = TextEditingController();

  DateTime? selectedDate;

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

  void translate() {
    notifyListeners();
  }

  void getUserData() async {
    String? resultName = await AppStorage.$read(key: StorageKey.name);
    String? resultLastName = await AppStorage.$read(key: StorageKey.lastName);
    String? resultDate = await AppStorage.$read(key: StorageKey.date);
  }

  void onDateTimeChanged(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }
}
