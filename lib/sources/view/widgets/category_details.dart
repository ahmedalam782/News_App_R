import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/Shared/Components/error_indicator.dart';
import 'package:news_app_route/Shared/Components/loading_indicator.dart';
import 'package:news_app_route/sources/view/widgets/sources_tabs.dart';
import 'package:news_app_route/sources/view_model/sources_states.dart';
import 'package:news_app_route/sources/view_model/sources_view_model.dart';

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
  final SourcesCubitViewModel _sourcesCubitViewModel = SourcesCubitViewModel();

  @override
  void initState() {
    _sourcesCubitViewModel.getSources(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _sourcesCubitViewModel,
      child: BlocBuilder<SourcesCubitViewModel, SourcesStates>(
        builder: (_, state) {
          if (state is SourcesLoadingState) {
            return const LoadingIndicator();
          } else if (state is SourcesFailureState) {
            return ErrorIndicator(
              message: state.errorMessage,
            );
          } else if (state is SourcesSuccessState) {
            return SourcesTabs(
              sources: state.sources,
              query: widget.query,
            );
          } else {
            return const ErrorIndicator(
              message: "No sources Found",
            );
          }
        },
      ),
    );
  }
}
