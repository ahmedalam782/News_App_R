import '../../../Shared/network/remote/end_point.dart';

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
        id: json[ApiKey.id],
        name: json[ApiKey.name],
        description: json[ApiKey.description],
        url: json[ApiKey.url],
        category: json[ApiKey.category],
        language: json[ApiKey.language],
        country: json[ApiKey.country],
      );
}
