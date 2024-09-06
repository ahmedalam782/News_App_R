import 'package:news_app_route/Models/Sources_Model/sources.dart';
import 'package:news_app_route/Shared/network/remote/end_point.dart';

class SourcesModel {
  String? status;
  List<Sources>? sources;

  SourcesModel({
    required this.sources,
    required this.status,
  });

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        sources: (json[ApiKey.sources] as List<dynamic>)
            .map(
              (e) => Sources.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        status: json[ApiKey.status],
      );
}
