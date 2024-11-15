import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knovator/get_it.dart';
import 'package:knovator/modules/posts/bloc/posts_bloc.dart';
import 'package:knovator/modules/posts/page/posts_page.dart';
import 'package:knovator/modules/splash/bloc/splash_bloc.dart';
import 'package:knovator/modules/splash/page/splash_page.dart';
import 'package:knovator/routes/app_routes.dart';
import 'package:knovator/routes/deflaut_route.dart';

class AppPages {
  static String getInitialRoute() => AppRoutes.SPLASH;

  static PageRouteBuilder _buildRoutes(Widget child) {
    return PageRouteBuilder(
      transitionsBuilder: (_, oppacity, __, widget) => FadeTransition(
        opacity: oppacity,
        child: widget,
      ),
      pageBuilder: (_, __, ___) => child,
    );
  }

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.SPLASH:
        return _buildRoutes(
          BlocProvider(
            create: (context) =>
                getIt.get<SplashBloc>()..add(NavigateToNextEvent()),
            child: const SplashPage(),
          ),
        );
      case AppRoutes.POSTS:
        return _buildRoutes(
          BlocProvider(
            create: (context) => getIt.get<PostsBloc>()..add(GetPostsEvent()),
            child: const PostsPage(),
          ),
        );

      default:
        return _buildRoutes(
          const DeflautRoute(),
        );
    }
  }
}
