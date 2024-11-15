import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:knovator/services/api_client.dart';
import 'package:knovator/config/constant/api_constants.dart';

class DioApiClient implements ApiClient {
  DioApiClient() {
    _dio = _onInit();
  }

  late Dio _dio;

  Dio _onInit() {
    final dio = Dio();
    dio.options.baseUrl = ApiConstants.BASE_URL;
    dio.options.sendTimeout = const Duration(seconds: 10);
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

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
  getPosts() async {
    final response = await _dio.get<List<dynamic>>(
      ApiConstants.POSTS,
    );
    return response;
  }

  @override
  getPostDetails(postId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${ApiConstants.POST_DETIALS}$postId',
    );
    return response;
  }
}
