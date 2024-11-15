part of 'post_details_bloc.dart';

sealed class PostDetailsEvent extends Equatable {
  const PostDetailsEvent();

  @override
  List<Object> get props => [];
}

final class GetPostDetailsEvent extends PostDetailsEvent {
  final int postId;

  const GetPostDetailsEvent({required this.postId});
}
