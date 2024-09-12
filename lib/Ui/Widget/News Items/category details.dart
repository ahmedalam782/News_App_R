import 'package:flutter/material.dart';
import 'package:news_app_route/Shared/Components/error_indicator.dart';
import 'package:news_app_route/Shared/Components/loading_indicator.dart';
import 'package:news_app_route/Ui/Widget/News%20Items/sources_tabs.dart';

import '../../../Shared/network/remote/news_services.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({
    super.key,
    required this.categoryId,
    required this.query,
  });

  final String categoryId;
  final String query;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsServices.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(
            sources: sources,
            query: widget.query,
          );
        }
      },
    );
  }
}
