import 'dart:async';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/models/posts_model.dart';
import 'package:knovator/services/dio/data_state.dart';
import 'package:knovator/modules/posts/repository/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _postsRepository;

  PostsBloc(this._postsRepository) : super(PostsInitialBuilderState()) {
    on<GetPostsEvent>(_getPosts);
    on<PostClickedEvent>(_goToPostDetails);
    on<UpdatePostReaddEvent>(_updatePostRead);
  }

  Future<void> _getPosts(event, emit) async {
    final dataState = await _postsRepository.getPosts();
    if (dataState is DataSuccess) {
      emit(
        SuccessfullyRetrievedPostsBuilderState(
          posts: dataState.data!,
        ),
      );
    } else {
      emit(
        FailedToRetrievePostsBuilderState(
          error: dataState.error!,
        ),
      );
    }
  }

  void _goToPostDetails(
    PostClickedEvent event,
    Emitter<PostsState> emit,
  ) {
    final successState = state as SuccessfullyRetrievedPostsBuilderState;
    emit(
      NavigateToPostDetailsListenerState(
        postId: event.postId,
        successState: successState,
      ),
    );
  }

  void _updatePostRead(
    UpdatePostReaddEvent event,
    Emitter<PostsState> emit,
  ) {
    emit(
      event.successState.copyWith(
        event.postId,
      ),
    );
  }
}
