import 'posts_builder.dart';
import 'posts_listener.dart';
import 'package:flutter/material.dart';
import 'package:knovator/config/theme/app_colors.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
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
