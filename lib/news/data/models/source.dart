import '../../../Shared/network/remote/end_point.dart';

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json[ApiKey.id] as String?,
        name: json[ApiKey.name] as String?,
      );
}
