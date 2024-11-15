import 'package:knovator/config/constant/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:knovator/services/api_client.dart';

class DioApiClient implements ApiClient {
  DioApiClient() {
    _dio = _onInit();
  }

  late Dio _dio;

  Dio _onInit() {
    final dio = Dio();
    dio.options.baseUrl = ApiConstants.BASE_URL;
    dio.options.sendTimeout = const Duration(milliseconds: 60000);
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (kDebugMode) {
            if (options.data is FormData) {
              FormData d = options.data;
              d.fields.forEach(((field) =>
                  debugPrint('Fields: ${field.key}: ${field.value}')));
              for (var field in d.files) {
                debugPrint(
                  'Files: ${field.key}: ${field.value.filename} ${field.value.contentType?.mimeType}',
                );
              }
            }
          }
          return handler.next(options);
        },
      ),
    );

    // Add logging interceptor with debug check.
    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        error: kDebugMode,
        responseHeader: kDebugMode,
        requestBody: kDebugMode,
        requestHeader: kDebugMode,
        responseBody: kDebugMode,
      ),
    );

    return dio;
  }

  @override
  void closeDioClient() {
    _dio.close(force: true);
  }

  @override
  posts() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.POSTS,
    );
    return response;
  }

  @override
  postDetails(postId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${ApiConstants.POST_DETIALS}$postId',
    );
    return response;
  }
}
