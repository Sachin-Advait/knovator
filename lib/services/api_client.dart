import 'package:dio/dio.dart';

abstract interface class ApiClient {
  /// Should be called on Token expiry to stop all api calls immediately.
  void closeDioClient();

  // Auth API Clients
  Future<Response<List<dynamic>>> getPosts();
  Future<Response<Map<String, dynamic>>> getPostDetails(String postId);
}
