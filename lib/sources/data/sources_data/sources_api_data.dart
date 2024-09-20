import 'package:news_app_route/Shared/service_locator.dart';
import 'package:news_app_route/sources/data/models/sources.dart';
import 'package:news_app_route/sources/data/sources_data/sources_data.dart';

import '../../../Shared/network/remote/end_point.dart';
import '../models/sources_model.dart';

class SourcesApiData extends SourcesData {
  @override
  Future<List<Sources>> getSources(String categoryId) async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.sources, {
      "apiKey": ApiKey.apiKey,
      "category": categoryId,
    });
    final response = await ServiceLocator.apiConsumer.get(url);
    SourcesModel sourcesModel = SourcesModel.fromJson(response);
    if (sourcesModel.status == 'ok' || sourcesModel.sources != null) {
      return sourcesModel.sources!;
    } else if (sourcesModel.errorServerModel?.message != null ||
        sourcesModel.errorServerModel?.status == 'error') {
      throw Exception(sourcesModel.errorServerModel?.message);
    } else {
      throw Exception('Failed to get sources');
    }
  }
}
