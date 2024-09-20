import '../models/sources.dart';

abstract class SourcesData {
  Future<List<Sources>> getSources(String categoryId);
}
