import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/config/theme/app_colors.dart';
import 'package:knovator/modules/posts/bloc/posts_bloc.dart';

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
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 10),
                ListTile(
                  dense: true,
                  tileColor: AppColors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  title: Text(
                    'fa;fafasdfasdf',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.black,
                        ),
                  ),
                  // trailing: Container(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
