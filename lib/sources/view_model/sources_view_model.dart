import 'package:flutter/material.dart';
import 'package:news_app_route/Shared/service_locator.dart';
import 'package:news_app_route/sources/data/models/sources.dart';
import 'package:news_app_route/sources/repository/sources_repository.dart';

class SourcesViewModel extends ChangeNotifier {
  final repository = SourcesRepository(ServiceLocator.sourcesData);
  List<Sources> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await repository.getSources(categoryId);
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
