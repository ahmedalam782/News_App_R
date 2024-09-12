import 'package:flutter/material.dart';
import 'package:news_app_route/Models/news_model/article.dart';
import 'package:news_app_route/Shared/network/remote/news_services.dart';

import '../../../Shared/Components/error_indicator.dart';
import '../../../Shared/Components/loading_indicator.dart';
import 'news_items.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId, required this.query});

  final String sourceId;
  final String query;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int page = 1;
  String? selectedSourceID;
  List<Article> news = [];
  bool forLoading = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsServices.getNews(widget.sourceId, widget.query, page),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            forLoading == false) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          if (selectedSourceID != widget.sourceId) {
            page = 1;
            selectedSourceID = widget.sourceId;
            news = [];
            forLoading = false;
          }
          if (news.isEmpty) {
            news = snapshot.data?.articles ?? [];
          } else if (snapshot.data?.articles?.isNotEmpty == true &&
              snapshot.data?.articles?.last.title != news.last.title) {
            news.addAll(snapshot.data?.articles ?? []);
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification) {
                if (snapshot.data?.articles?.isNotEmpty == true) {
                  page++;
                  forLoading = true;
                  setState(() {});
                }
              }
              return true;
            },
            child: ListView.builder(
              itemBuilder: (_, index) {
                if (index < news.length) {
                  return NewsItems(
                    article: news[index],
                  );
                } else {
                  return news.length != snapshot.data?.totalResults
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.sizeOf(context).height * .05),
                          child: const LoadingIndicator(),
                        )
                      : const SizedBox();
                }
              },
              itemCount: news.length + 1,
            ),
          );
        }
      },
    );
  }
}
