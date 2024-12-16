import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';

final profileVm = ChangeNotifierProvider((ref) => ProfileVm());

enum Language { uzbek, russian }

class ProfileVm extends ChangeNotifier {
  ProfileVm() {
    getUserData();
  }

  Language? selectedLanguage;

  bool isAppNotificationOn = false;
  bool isTelegramNotificationOn = false;
  bool textActive = false;

  String resultName = "";
  String resultLastName = "";
  String resultDate = "";

  TextEditingController ismTextEditingController = TextEditingController();
  TextEditingController familiyaTextEditingController = TextEditingController();
  TextEditingController sanaTextEditingController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  // String ism = "";

  DateTime? selectedDate;

  void onChanged(String? value) {
    globalKey.currentState!.validate();
    notifyListeners();
  }

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
    resultName = await AppStorage.$read(key: StorageKey.ism) ?? "";
    resultLastName = await AppStorage.$read(key: StorageKey.lastName) ?? "";
    resultDate = await AppStorage.$read(key: StorageKey.date) ?? "";

    ismTextEditingController.text = resultName;
    familiyaTextEditingController.text = resultLastName;
    sanaTextEditingController.text = resultDate;

    notifyListeners();
  }

  void onDateTimeChanged(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  void focusPage({bool isActive = false}) {
    textActive = isActive;
    notifyListeners();
  }
}
