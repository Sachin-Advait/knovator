import 'package:flutter/material.dart';
import 'package:knovator/modules/posts/bloc/posts_bloc.dart';
import '../../../config/theme/app_colors.dart';

class PostsView extends StatelessWidget {
  final PostsBloc bloc;
  final SuccessfullyRetrievedPostsBuilderState state;

  const PostsView({
    super.key,
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      itemCount: state.posts.length,
      itemBuilder: (context, index) {
        final post = state.posts[index];
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListTile(
            dense: true,
            tileColor: post.isRead ? AppColors.white : AppColors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            title: Text(
              'Title: ${post.title}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.black,
                  ),
            ),
            onTap: () {
              bloc.add(
                PostClickedEvent(
                  postId: post.id!,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
