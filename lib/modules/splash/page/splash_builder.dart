import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/modules/splash/bloc/splash_bloc.dart';
import 'package:knovator/modules/splash/components/splash_view.dart';

class SplashBuilder extends StatelessWidget {
  const SplashBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      buildWhen: (previous, current) => current is SplashBuilderState,
      builder: (context, state) {
        switch (state as SplashBuilderState) {
          case SplashInitialBuilderState _:
            return const SplashView();
        }
      },
    );
  }
}
