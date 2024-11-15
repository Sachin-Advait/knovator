part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

/// ----------------------- Builder States -----------------------
sealed class SplashBuilderState extends SplashState {}

final class SplashInitialBuilderState extends SplashBuilderState {}

/// ----------------------- Action States -----------------------
sealed class SplashListenerState extends SplashState {}

final class NavigateToPostsListenerState extends SplashListenerState {}
