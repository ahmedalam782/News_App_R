import 'package:news_app_route/Settings/data/setting_data.dart';

class SettingRepository {
  final SettingData settingData;

  SettingRepository(this.settingData);

  Future<void> saveLanguage(String selectedLanguage) async {
    settingData.saveLanguage(selectedLanguage);
  }

  Future<String?> getLanguage() async {
    return settingData.getLanguage();
  }
}
