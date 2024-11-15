import 'package:flutter/material.dart';
import 'package:knovator/modules/splash/page/splash_builder.dart';
import 'package:knovator/modules/splash/page/splash_listener.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashListener(
          child: SplashBuilder(),
        ),
      ),
    );
  }
}
