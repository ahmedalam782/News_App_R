import 'package:flutter/material.dart';
import 'package:news_app_route/sources/data/models/sources.dart';
import 'package:news_app_route/sources/data/sources_data/sources_data_model.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesDataModel sourcesDataModel = SourcesDataModel();
  List<Sources> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await sourcesDataModel.getSources(categoryId);
      if (response.status == 'ok' || response.sources != null) {
        sources = response.sources!;
      } else if (response.errorServerModel?.message != null ||
          response.errorServerModel?.status == 'error') {
        errorMessage = response.errorServerModel?.message;
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
