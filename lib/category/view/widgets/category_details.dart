import 'package:flutter/material.dart';
import 'package:news_app_route/Shared/Components/error_indicator.dart';
import 'package:news_app_route/Shared/Components/loading_indicator.dart';
import 'package:news_app_route/sources/view/widgets/sources_tabs.dart';
import 'package:news_app_route/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

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
  SourcesViewModel sourcesViewModel = SourcesViewModel();

  @override
  void initState() {
    sourcesViewModel.getSources(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sourcesViewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, sourcesViewModel, __) {
          if (sourcesViewModel.isLoading) {
            return const LoadingIndicator();
          } else if (sourcesViewModel.errorMessage != null) {
            return ErrorIndicator(
              message: sourcesViewModel.errorMessage,
            );
          } else {
            return SourcesTabs(
              sources: sourcesViewModel.sources,
              query: widget.query,
            );
          }
        },
      ),
    );
  }
}
