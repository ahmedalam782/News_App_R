import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_app_route/Models/news_model/article.dart';
import 'package:news_app_route/Shared/Exceptions/server_exceptions.dart';
import 'package:news_app_route/Shared/network/remote/end_point.dart';
import 'package:http/http.dart' as http;

import '../../../Models/Sources_Model/sources_model.dart';
import '../../../Models/news_model/news_model.dart';

class NewsServices {
  static Future<dynamic> getSources(String categoryId) async {
    try {
      final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.sources, {
        "apiKey": ApiKey.apiKey,
        "category": categoryId,
      });
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      return SourcesModel.fromJson(json);
    } on http.Response catch (e) {
      return ServerExceptions.handleHttpException(e);
    }
  }

  static Future<dynamic> getNews(String? sourceId, String? q, int page) async {
    try {
      final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.topHeadLines, {
        "apiKey": ApiKey.apiKey,
        "sources": sourceId,
        "pageSize": '5',
        "page": page.toString(),
        'q': q
      });
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      return NewsModel.fromJson(json);
    } on http.Response catch (e) {
      return ServerExceptions.handleHttpException(e);
    }
  }
}
