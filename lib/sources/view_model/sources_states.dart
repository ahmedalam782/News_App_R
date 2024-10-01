import '../data/models/sources.dart';

abstract class SourcesStates {}

class SourcesInitialState extends SourcesStates {}

class SourcesLoadingState extends SourcesStates {}

class SourcesSuccessState extends SourcesStates {
  final List<Sources> sources;

  SourcesSuccessState({required this.sources});
}

class SourcesFailureState extends SourcesStates {
  final String errorMessage;

  SourcesFailureState({required this.errorMessage});
}
