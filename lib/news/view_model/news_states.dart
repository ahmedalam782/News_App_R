import 'package:news_app_route/news/data/models/article.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsSuccessState extends NewsStates {
  final List<Article> news;

  NewsSuccessState({required this.news});
}

class NewsFailureState extends NewsStates {
  final String errorMessage;

  NewsFailureState({required this.errorMessage});
}

class NewsPaginationState extends NewsStates {}
