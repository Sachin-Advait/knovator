import 'package:dio/dio.dart';

abstract class ApiClient {
  /// Should be called on Token expiry to stop all api calls immediately.
  void closeDioClient();

  // Auth API Clients
  Future<Response?> posts();
  Future<Response?> postDetails(String postId);
}
