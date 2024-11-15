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

  PostsBloc(this._postsRepository) : super(PostsInitialUIState()) {
    on<GetPostsEvent>(_getPosts);
    on<PostClickedEvent>(_updatePostReadAndGoToPostDetails);
  }

  Future<void> _getPosts(event, emit) async {
    final dataState = await _postsRepository.getPosts();
    if (dataState is DataSuccess) {
      emit(
        SuccessfullyRetrievedPostsUIState(
          posts: dataState.data!,
        ),
      );
    } else {
      emit(
        FailedToRetrievePostsUIState(
          error: dataState.error!,
        ),
      );
    }
  }

  void _updatePostReadAndGoToPostDetails(
    PostClickedEvent event,
    Emitter<PostsState> emit,
  ) {}
}
