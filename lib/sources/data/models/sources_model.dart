import 'package:news_app_route/Shared/network/remote/end_point.dart';
import 'package:news_app_route/sources/data/models/sources.dart';

import '../../../Shared/Exceptions/Error_Server_Model/error_server_model.dart';

class SourcesModel {
  String? status;
  List<Sources>? sources;
  ErrorServerModel? errorServerModel;

  SourcesModel({
    this.sources,
    this.status,
    this.errorServerModel,
  });

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        status: json[ApiKey.status],
        sources: json[ApiKey.sources] == null
            ? null
            : (json[ApiKey.sources] as List<dynamic>)
                .map(
                  (e) => Sources.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
