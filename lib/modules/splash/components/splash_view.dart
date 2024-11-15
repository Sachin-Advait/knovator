import 'package:flutter/material.dart';
import 'package:knovator/config/assets/app_images.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
