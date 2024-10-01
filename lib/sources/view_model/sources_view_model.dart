import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/Shared/service_locator.dart';
import 'package:news_app_route/sources/repository/sources_repository.dart';
import 'package:news_app_route/sources/view_model/sources_states.dart';

class SourcesCubitViewModel extends Cubit<SourcesStates> {
  late final SourcesRepository repository;

  static SourcesCubitViewModel get(context) => BlocProvider.of(context);

  SourcesCubitViewModel() : super(SourcesInitialState()) {
    repository = SourcesRepository(ServiceLocator.sourcesData);
  }

  Future<void> getSources(String categoryId) async {
    emit(SourcesLoadingState());
    try {
      final sources = await repository.getSources(categoryId);
      emit(
        SourcesSuccessState(sources: sources),
      );
    } catch (e) {
      emit(SourcesFailureState(errorMessage: e.toString()));
    }
  }
}
