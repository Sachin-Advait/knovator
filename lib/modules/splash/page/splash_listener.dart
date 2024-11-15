import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/routes/app_routes.dart';
import 'package:knovator/modules/splash/bloc/splash_bloc.dart';

class SplashListener extends StatelessWidget {
  final Widget child;

  const SplashListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (_, current) => current is SplashListenerState,
      listener: (_, state) {
        switch (state as SplashListenerState) {
          case NavigateToPostsListenerState _:
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.POSTS,
              (route) => false,
            );
        }
      },
      child: child,
    );
  }
}
