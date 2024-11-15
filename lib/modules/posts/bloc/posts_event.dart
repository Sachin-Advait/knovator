part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

final class GetPostsEvent extends PostsEvent {}

final class PostClickedEvent extends PostsEvent {
  final PostsModel post;

  const PostClickedEvent({
    required this.post,
  });
}
