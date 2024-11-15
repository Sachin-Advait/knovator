import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialBuilderState()) {
    on<NavigateToNextEvent>(_goToNext);
  }

  Future<void> _goToNext(
    NavigateToNextEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    emit(NavigateToPostsListenerState());
  }
}
