import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/news/view_model/news_states.dart';
import 'package:news_app_route/news/view_model/news_view_model.dart';

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
  final NewsCubitViewModel _newsCubitViewModel = NewsCubitViewModel();
  String? selectedSourceId;
  String selectQuery = "";

  @override
  Widget build(BuildContext context) {
    if (selectedSourceId != widget.sourceId ||
        widget.query != null && selectQuery != widget.query) {
      selectedSourceId = widget.sourceId;
      selectQuery = widget.query ?? "";
      _newsCubitViewModel.getNews(widget.sourceId ?? "", widget.query ?? "");
    }
    return BlocProvider(
      create: (_) => _newsCubitViewModel,
      child: BlocBuilder<NewsCubitViewModel, NewsStates>(
        buildWhen: (previous, current) => current is! NewsPaginationState,
        builder: (context, state) {
          NewsCubitViewModel newsCubitViewModel =
              NewsCubitViewModel.get(context);
          if (state is NewsLoadingState) {
            return const LoadingIndicator();
          } else if (state is NewsFailureState) {
            return ErrorIndicator(
              message: state.errorMessage,
            );
          } else if (state is NewsSuccessState) {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                    notification is ScrollUpdateNotification) {
                  if (newsCubitViewModel.hasMore) {
                    newsCubitViewModel.getNews(
                        widget.sourceId ?? "", widget.query ?? "",
                        isLoadingFromPagination: true);
                  }
                }
                return true;
              },
              child: ListView.builder(
                itemBuilder: (_, index) {
                  if (index < newsCubitViewModel.news.length) {
                    return NewsItems(
                      article: state.news[index],
                    );
                  } else {
                    return newsCubitViewModel.hasMore
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.sizeOf(context).height * .05),
                            child: const LoadingIndicator(),
                          )
                        : const SizedBox();
                  }
                },
                itemCount: state.news.length + 1,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
