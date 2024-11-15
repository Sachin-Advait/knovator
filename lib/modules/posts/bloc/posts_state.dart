part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

/// ----------------------- Builder States -----------------------

sealed class PostsBuilderState extends PostsState {}

final class PostsInitialBuilderState extends PostsBuilderState {}

final class SuccessfullyRetrievedPostsBuilderState extends PostsBuilderState {
  final List<PostsModel> posts;

  SuccessfullyRetrievedPostsBuilderState({
    required this.posts,
  });

  @override
  List<Object> get props => [posts];

  SuccessfullyRetrievedPostsBuilderState copyWith(int postId) {
    final toUpdateIndex = posts.indexWhere((element) => element.id == postId);
    posts[toUpdateIndex].isRead = true;

    return SuccessfullyRetrievedPostsBuilderState(posts: posts);
  }
}

final class FailedToRetrievePostsBuilderState extends PostsBuilderState {
  final DioException error;

  FailedToRetrievePostsBuilderState({
    required this.error,
  });
}

/// ----------------------- Action States -----------------------

sealed class PostsListenerState extends PostsState {}

final class NavigateToPostDetailsListenerState extends PostsListenerState {
  final int postId;
  final SuccessfullyRetrievedPostsBuilderState successState;

  NavigateToPostDetailsListenerState({
    required this.successState,
    required this.postId,
  });
}
