import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_route/Shared/network/remote/api_consumer.dart';

class HttpConsumer extends ApiConsumer {
  @override
  Future get(Uri url, {Map<String, String>? headers}) async {
    final response = await http.get(
      url,
      headers: headers,
    );
    final json = jsonDecode(response.body);
    return json;
  }
}
