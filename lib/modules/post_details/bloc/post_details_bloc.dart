import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/models/posts_model.dart';
import 'package:knovator/database/app_database.dart';
import 'package:knovator/services/dio/data_state.dart';
import 'package:knovator/modules/post_details/repository/post_details_repository.dart';

part 'post_details_event.dart';
part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  final PostDetailsRepository _postDetailsRepository;
  final AppDatabase _appDatabase;

  PostDetailsBloc(this._postDetailsRepository, this._appDatabase)
      : super(PostDetailsInitialBuilderState()) {
    on<GetPostDetailsEvent>(_getPostDetails);
  }

  void _getPostDetails(
    GetPostDetailsEvent event,
    Emitter<PostDetailsState> emit,
  ) async {
    final dataState = await _postDetailsRepository.getPostDetails(event.postId);
    if (dataState is DataSuccess) {
      emit(
        SuccessfullyRetrievedPostDetailsBuilderState(
          post: dataState.data!,
        ),
      );
    } else {
      final postDetailsFromDB = await _appDatabase.getPost(event.postId);
      if (postDetailsFromDB != null) {
        emit(
          SuccessfullyRetrievedPostDetailsBuilderState(
            post: postDetailsFromDB,
          ),
        );
      } else {
        emit(
          FailedToRetrievePostDetailsBuilderState(
            error: dataState.error!,
          ),
        );
      }
    }
  }
}
