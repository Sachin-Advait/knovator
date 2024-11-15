import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/config/theme/app_colors.dart';
import 'package:knovator/config/constant/app_errors.dart';
import 'package:knovator/modules/post_details/bloc/post_details_bloc.dart';

class PostDetailsBuilder extends StatelessWidget {
  const PostDetailsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      buildWhen: (_, current) => current is PostDetailsBuilderState,
      builder: (context, state) {
        switch (state as PostDetailsBuilderState) {
          case PostDetailsInitialBuilderState _:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );

          case SuccessfullyRetrievedPostDetailsBuilderState successState:
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22),
                  Text(
                    'This is the post body',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    successState.post.body ?? 'N/A',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            );

          case FailedToRetrievePostDetailsBuilderState failedState:
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
