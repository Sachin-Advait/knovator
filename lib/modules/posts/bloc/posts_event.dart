part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

final class GetPostsEvent extends PostsEvent {}

final class PostClickedEvent extends PostsEvent {
  final int postId;

  const PostClickedEvent({
    required this.postId,
  });
}

final class UpdatePostReaddEvent extends PostsEvent {
  final int postId;
  final SuccessfullyRetrievedPostsBuilderState successState;

  const UpdatePostReaddEvent({
    required this.postId,
    required this.successState,
  });
}
