import 'package:flutter/material.dart';

import '../../../../../Shared/network/local/cache_helper.dart';

class SettingsViewModel extends ChangeNotifier {
  String lang = "en";

  Future<void> changeLanguage(String selectedLanguage) async {
    lang = selectedLanguage;
    await CacheHelper.saveData(key: 'isLanguage', value: lang);
    notifyListeners();
  }
}
