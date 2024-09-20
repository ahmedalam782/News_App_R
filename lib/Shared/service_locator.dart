import 'package:news_app_route/Settings/data/setting_cashed_data.dart';
import 'package:news_app_route/Settings/data/setting_data.dart';
import 'package:news_app_route/news/data/news_data_model/news_api_data.dart';
import 'package:news_app_route/news/data/news_data_model/news_data.dart';
import 'package:news_app_route/sources/data/sources_data/sources_api_data.dart';
import 'package:news_app_route/sources/data/sources_data/sources_data.dart';

import 'network/remote/api_consumer.dart';
import 'network/remote/http_consumer.dart';

class ServiceLocator {
  static ApiConsumer apiConsumer = HttpConsumer();
  static SourcesData sourcesData = SourcesApiData();
  static SettingData settingData = SettingCashedData();
  static NewsData newsData = NewsApiData();
}
