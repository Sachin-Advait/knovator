import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/modules/post_details/bloc/post_details_bloc.dart';

class PostDetailsListener extends StatelessWidget {
  final Widget child;

  const PostDetailsListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailsBloc, PostDetailsState>(
      listenWhen: (_, current) => current is PostDetailsListenerState,
      listener: (context, state) {
        switch (state as PostDetailsListenerState) {}
      },
      child: child,
    );
  }
}
