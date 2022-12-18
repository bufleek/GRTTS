import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseRepo {
  final String baseURL = "http://localhost:8000/api";

  Future<http.Response> get(String path) => http.get(
        Uri.parse("$baseURL/path"),
        headers: {"Content-Type": "application/json"},
      );

  Future<http.Response> post(
    String path, {
    Map<String, dynamic> body = const {},
  }) =>
      http.post(
        Uri.parse("$baseURL/$path"),
        body: body,
      );

  void printError(String tag, Object error) {
    if (kDebugMode) {
      print({"tag": tag, "error": error});
    }
  }
}
