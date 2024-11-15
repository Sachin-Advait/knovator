import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/routes/app_routes.dart';
import 'package:knovator/modules/posts/bloc/posts_bloc.dart';

class PostsListener extends StatelessWidget {
  final Widget child;

  const PostsListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsBloc, PostsState>(
      listenWhen: (_, current) => current is PostsListenerState,
      listener: (context, state) async {
        final bloc = context.read<PostsBloc>();
        switch (state as PostsListenerState) {
          case NavigateToPostDetailsListenerState
            navigateToPostDetailsListenerState:
            await Navigator.of(context).pushNamed(
              AppRoutes.POST_DETAILS,
              arguments: {
                'post_id': navigateToPostDetailsListenerState.postId,
              },
            );

            bloc.add(
              UpdatePostReaddEvent(
                postId: navigateToPostDetailsListenerState.postId,
                successState: navigateToPostDetailsListenerState.successState,
              ),
            );
        }
      },
      child: child,
    );
  }
}
