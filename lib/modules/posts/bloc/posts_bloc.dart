import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/models/posts_model.dart';
import 'package:knovator/database/app_database.dart';
import 'package:knovator/services/dio/data_state.dart';
import 'package:knovator/modules/posts/repository/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _postsRepository;
  final AppDatabase _appDatabase;
  final Map<int, Timer> _timers = {};

  PostsBloc(this._postsRepository, this._appDatabase)
      : super(PostsInitialBuilderState()) {
    on<GetPostsEvent>(_getPosts);
    on<PostClickedEvent>(_goToPostDetails);
    on<UpdatePostReaddEvent>(_updatePostRead);

    /// Time Events.
    on<StartPostTimerEvent>(_startPostTimer);
    on<StopPostTimerEvent>(_stopPostTimer);
    on<_UpdatePostElapsedTimeEvent>(_updateElapsedTime);
  }

  @override
  Future<void> close() {
    for (var timer in _timers.values) {
      timer.cancel();
    }
    return super.close();
  }

  FutureOr<void> _getPosts(
    GetPostsEvent _,
    Emitter<PostsState> emit,
  ) async {
    final postsFromDB = await _appDatabase.getPosts();

    if (postsFromDB.isEmpty) {
      final dataState = await _postsRepository.getPosts();

      if (dataState is DataSuccess) {
        _addOrUpdateDBAndEmit(dataState.data!, emit);
      } else {
        emit(
          FailedToRetrievePostsBuilderState(
            error: dataState.error!,
          ),
        );
      }
    } else {
      emit(
        SuccessfullyRetrievedPostsBuilderState(
          posts: postsFromDB,
        ),
      );

      final dataState = await _postsRepository.getPosts();
      if (dataState is DataSuccess) {
        _addOrUpdateDBAndEmit(
          dataState.data!,
          emit,
          postsFromDB: postsFromDB,
        );
      }
    }
  }

  Future<void> _addOrUpdateDBAndEmit(
    List<PostsModel> posts,
    Emitter<PostsState> emit, {
    List<PostsModel>? postsFromDB,
  }) async {
    /// Check for previous post isRead value and Add or update posts accordingly.
    if (postsFromDB != null) {
      final alreadyReadPosts =
          postsFromDB.where((post) => post.isRead).toList();

      final alreadyReadPostsId =
          alreadyReadPosts.map((readPost) => readPost.id!).toList();

      if (alreadyReadPostsId.isNotEmpty) {
        for (var post in posts) {
          if (alreadyReadPostsId.contains(post.id)) {
            /// Now we check whether the post has same body and title or not.
            if (alreadyReadPosts[alreadyReadPostsId.indexOf(post.id!)].body ==
                    post.body &&
                alreadyReadPosts[alreadyReadPostsId.indexOf(post.id!)].title ==
                    post.title) {
              debugPrint(
                '-------------- Updated isRead value for id ==> ${post.id} --------------',
              );
              post.isRead = true;
            }
          }
        }
      }
    }

    _appDatabase.addPosts(posts);

    emit(
      SuccessfullyRetrievedPostsBuilderState(
        posts: posts,
      ),
    );
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
    _appDatabase.updatePostReadStatus(event.postId, true);
  }

  Future<void> _startPostTimer(
    StartPostTimerEvent event,
    Emitter<PostsState> _,
  ) async {
    if (_timers.containsKey(event.postId)) return;

    _timers[event.postId] = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        add(_UpdatePostElapsedTimeEvent(postId: event.postId));
      },
    );
  }

  void _stopPostTimer(
    StopPostTimerEvent event,
    Emitter<PostsState> _,
  ) {
    _timers[event.postId]?.cancel();
    _timers.remove(event.postId);
  }

  void _updateElapsedTime(
    _UpdatePostElapsedTimeEvent event,
    Emitter<PostsState> emit,
  ) {
    if (state is SuccessfullyRetrievedPostsBuilderState) {
      final currentState = state as SuccessfullyRetrievedPostsBuilderState;
      final posts = currentState.posts;

      final index = posts.indexWhere((post) => post.id == event.postId);
      if (index != -1) {
        // Create a new list with the updated post
        final updatedPosts = List<PostsModel>.from(posts);
        updatedPosts[index] = updatedPosts[index].copyWith(
          elapsedTime: updatedPosts[index].elapsedTime +
              const Duration(
                seconds: 1,
              ),
        );

        emit(
          SuccessfullyRetrievedPostsBuilderState(
            posts: updatedPosts,
          ),
        );
      }
    }
  }
}
