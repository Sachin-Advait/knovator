import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/config/theme/app_colors.dart';
import 'package:knovator/config/constant/app_errors.dart';
import 'package:knovator/modules/posts/bloc/posts_bloc.dart';
import 'package:knovator/modules/posts/components/posts_view.dart';

class PostBuilder extends StatelessWidget {
  const PostBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      buildWhen: (_, current) => current is PostsBuilderState,
      builder: (context, state) {
        final bloc = context.read<PostsBloc>();

        switch (state as PostsBuilderState) {
          case PostsInitialBuilderState _:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );

          case SuccessfullyRetrievedPostsBuilderState successState:
            return PostsView(
              bloc: bloc,
              state: successState,
            );

          case FailedToRetrievePostsBuilderState failedState:
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    AppErrors.unknownErrorDetails,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    failedState.error.error.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
