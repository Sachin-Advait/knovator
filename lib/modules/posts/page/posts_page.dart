import 'package:flutter/material.dart';
import 'package:knovator/config/theme/app_colors.dart';
import 'package:knovator/modules/posts/page/posts_builder.dart';
import 'package:knovator/modules/posts/page/posts_listener.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Posts',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const SafeArea(
        child: PostsListener(
          child: PostBuilder(),
        ),
      ),
    );
  }
}
