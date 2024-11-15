import 'package:knovator/config/assets/app_images.dart';
import 'package:knovator/routes/app_routes.dart';

import '../bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (_, state) {
            switch (state) {
              case SplashInitial():
              // Do Nothing.

              case NavigateToPostsActionState():
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.POSTS,
                  (route) => false,
                );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  AppImages.appLogo,
                  height: 150,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
