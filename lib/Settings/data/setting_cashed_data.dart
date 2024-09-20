import 'package:news_app_route/Settings/data/setting_data.dart';
import 'package:news_app_route/Shared/constants/drawer_items.dart';

import '../../Shared/network/local/cache_helper.dart';

class SettingCashedData extends SettingData {
  @override
  Future<void> saveLanguage(String language) async {
    await CacheHelper.init();
    await CacheHelper.saveData(key: CashedKey.language, value: language);
  }

  @override
  Future<String?> getLanguage() async {
    await CacheHelper.init();
    return await CacheHelper.getData(key: CashedKey.language);
  }
}
