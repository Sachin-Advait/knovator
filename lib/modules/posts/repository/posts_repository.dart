import 'package:dio/dio.dart';
import 'package:knovator/models/posts_model.dart';
import 'package:knovator/services/api_client.dart';
import 'package:knovator/services/dio/data_state.dart';

class PostsRepository {
  final ApiClient _apiClient;

  PostsRepository(this._apiClient);

  Future<DataState<List<PostsModel>>> getPosts() async {
    try {
      final response = await _apiClient.getPosts();

      if (response.statusCode == 200) {
        return DataSuccess(
          data: (response.data as List)
              .map((post) => PostsModel.fromJson(post))
              .toList(),
        );
      } else {
        return DataFailed(
          error: DioException(
            requestOptions: response.requestOptions,
            message: response.statusMessage,
          ),
        );
      }
    } on DioException catch (error) {
      return DataFailed(error: error);
    }
  }
}
