import 'package:dio/dio.dart';
import 'package:knovator/models/posts_model.dart';
import 'package:knovator/services/api_client.dart';
import 'package:knovator/services/dio/data_state.dart';

class PostDetailsRepository {
  final ApiClient _apiClient;

  PostDetailsRepository(this._apiClient);

  Future<DataState<PostsModel>> getPostDetails(int postId) async {
    try {
      final response = await _apiClient.getPostDetails(postId);

      if (response.statusCode == 200) {
        return DataSuccess(
          data: PostsModel.fromJson(response.data!),
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
