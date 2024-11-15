import 'package:dio/dio.dart';

abstract interface class ApiClient {
  // Auth API Clients
  Future<Response<List<dynamic>>> getPosts();
  Future<Response<Map<String, dynamic>>> getPostDetails(int postId);
}
