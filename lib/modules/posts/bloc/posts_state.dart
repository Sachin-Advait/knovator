part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

/// ----------------------- UI States -----------------------

sealed class PostsUIState extends PostsState {}

final class PostsInitialUIState extends PostsUIState {}

final class SuccessfullyRetrievedPostsUIState extends PostsUIState {
  final List<PostsModel> posts;

  SuccessfullyRetrievedPostsUIState({
    required this.posts,
  });
}

final class FailedToRetrievePostsUIState extends PostsUIState {
  final DioException error;

  FailedToRetrievePostsUIState({
    required this.error,
  });
}

final class SilentlyLoadPostsFromLocalDatabaseUIState extends PostsUIState {
  final List<PostsModel> posts;

  SilentlyLoadPostsFromLocalDatabaseUIState({
    required this.posts,
  });
}

/// ----------------------- Action States -----------------------

sealed class PostsActionState extends PostsState {}

final class NavigateToPostDetailsActionState extends PostsActionState {
  final int postId;

  NavigateToPostDetailsActionState({
    required this.postId,
  });
}
