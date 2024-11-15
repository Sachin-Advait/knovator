part of 'post_details_bloc.dart';

sealed class PostDetailsState extends Equatable {
  const PostDetailsState();

  @override
  List<Object> get props => [];
}

/// ----------------------- Builder States -----------------------
sealed class PostDetailsBuilderState extends PostDetailsState {}

final class PostDetailsInitialBuilderState extends PostDetailsBuilderState {}

final class SuccessfullyRetrievedPostDetailsBuilderState
    extends PostDetailsBuilderState {
  final PostsModel post;

  SuccessfullyRetrievedPostDetailsBuilderState({required this.post});
}

final class FailedToRetrievePostDetailsBuilderState
    extends PostDetailsBuilderState {
  final DioException error;

  FailedToRetrievePostDetailsBuilderState({
    required this.error,
  });
}

/// ----------------------- Action States -----------------------
sealed class PostDetailsListenerState extends PostDetailsState {}
