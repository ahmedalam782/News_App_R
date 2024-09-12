import 'package:flutter/material.dart';
import 'package:news_app_route/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

import '../../../Shared/Components/error_indicator.dart';
import '../../../Shared/Components/loading_indicator.dart';
import 'news_items.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId, required this.query});

  final String? sourceId;
  final String? query;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsViewModel newsViewModel = NewsViewModel();
  String? selectedSourceId;
  String selectQuery = "";

  @override
  Widget build(BuildContext context) {
    if (selectedSourceId != widget.sourceId ||
        widget.query != null && selectQuery != widget.query) {
      selectedSourceId = widget.sourceId;
      selectQuery = widget.query ?? "";
      newsViewModel.getNews(widget.sourceId ?? "", widget.query ?? "");
    }
    return ChangeNotifierProvider(
      create: (_) => newsViewModel,
      child: Consumer<NewsViewModel>(builder: (_, newsViewModel, __) {
        if (newsViewModel.isLoading) {
          return const LoadingIndicator();
        } else if (newsViewModel.errorMessage != null) {
          return ErrorIndicator(
            message: newsViewModel.errorMessage,
          );
        } else {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification) {
                if (newsViewModel.hasMore) {
                  newsViewModel.getNews(
                    widget.sourceId ?? "",
                    widget.query ?? "",
                    isLoadingFromPagination: true,
                  );
                }
              }
              return true;
            },
            child: ListView.builder(
              itemBuilder: (_, index) {
                if (index < newsViewModel.article.length) {
                  return NewsItems(
                    article: newsViewModel.article[index],
                  );
                } else {
                  return newsViewModel.isLoadingPagination
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.sizeOf(context).height * .05),
                          child: const LoadingIndicator(),
                        )
                      : const SizedBox();
                }
              },
              itemCount: newsViewModel.article.length + 1,
            ),
          );
        }
      }),
    );
  }
}
