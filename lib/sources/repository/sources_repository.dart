import '../data/models/sources.dart';
import '../data/sources_data/sources_data.dart';

class SourcesRepository {
  final SourcesData sourcesData;

  SourcesRepository(this.sourcesData);

  Future<List<Sources>> getSources(String categoryId) async {
    return await sourcesData.getSources(categoryId);
  }
}
