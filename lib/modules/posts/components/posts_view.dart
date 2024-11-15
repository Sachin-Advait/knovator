import 'package:flutter/material.dart';
import 'package:knovator/config/theme/app_colors.dart';
import 'package:knovator/modules/posts/bloc/posts_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostsView extends StatelessWidget {
  final PostsBloc bloc;
  final SuccessfullyRetrievedPostsBuilderState state;

  const PostsView({
    super.key,
    required this.bloc,
    required this.state,
  });

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

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
          child: VisibilityDetector(
            key: Key(post.id.toString()),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                bloc.add(StartPostTimerEvent(postId: post.id!));
              } else {
                bloc.add(StopPostTimerEvent(postId: post.id!));
              }
            },
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
              trailing: SizedBox(
                width: 105,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: AppColors.black.withOpacity(.7),
                      size: 20,
                    ),
                    const SizedBox(width: 5), // Space between icon and text
                    Text(
                      _formatDuration(post.elapsedTime),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            color: AppColors.black.withOpacity(.7),
                          ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                bloc.add(
                  StopPostTimerEvent(
                    postId: post.id!,
                  ),
                );

                bloc.add(
                  PostClickedEvent(
                    postId: post.id!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
