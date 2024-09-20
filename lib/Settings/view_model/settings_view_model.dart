import 'package:flutter/material.dart';
import 'package:news_app_route/Settings/repository/setting_repository.dart';
import 'package:news_app_route/Shared/service_locator.dart';

class SettingsViewModel extends ChangeNotifier {
  String lang = "en";
  final repository = SettingRepository(ServiceLocator.settingData);
  Future<void> changeLanguage(String selectedLanguage) async {
    lang = selectedLanguage;
    repository.saveLanguage(lang);
    notifyListeners();
  }
}
