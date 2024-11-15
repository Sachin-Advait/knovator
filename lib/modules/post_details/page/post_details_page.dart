import 'package:flutter/material.dart';
import 'package:knovator/config/theme/app_colors.dart';
import 'package:knovator/modules/post_details/page/post_details_builder.dart';
import 'package:knovator/modules/post_details/page/post_details_listener.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Post Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const SafeArea(
        child: PostDetailsListener(
          child: PostDetailsBuilder(),
        ),
      ),
    );
  }
}
