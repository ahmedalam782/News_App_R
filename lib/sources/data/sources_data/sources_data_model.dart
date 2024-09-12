import 'package:news_app_route/Shared/network/remote/api_consumer.dart';
import 'package:news_app_route/Shared/network/remote/http_consumer.dart';

import '../../../Shared/network/remote/end_point.dart';
import '../models/sources_model.dart';

class SourcesDataModel {
  ApiConsumer apiConsumer = HttpConsumer();

  Future<SourcesModel> getSources(String categoryId) async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.sources, {
      "apiKey": ApiKey.apiKey,
      "category": categoryId,
    });
    final response = await apiConsumer.get(url);
    return SourcesModel.fromJson(response);
  }
}
