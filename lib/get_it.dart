import 'package:get_it/get_it.dart';
import 'package:knovator/database/app_database.dart';
import 'package:knovator/modules/post_details/bloc/post_details_bloc.dart';
import 'package:knovator/modules/post_details/repository/post_details_repository.dart';
import 'package:knovator/modules/posts/bloc/posts_bloc.dart';
import 'package:knovator/modules/posts/repository/posts_repository.dart';
import 'package:knovator/modules/splash/bloc/splash_bloc.dart';
import 'package:knovator/services/api_client.dart';
import 'package:knovator/services/dio/dio_api_client.dart';

final getIt = GetIt.instance;

void getItSetup() {
  /// ------------- Register a lazy singleton for Dio API Client. -------------

  getIt.registerLazySingleton<ApiClient>(() => DioApiClient());

  /// ------------- Register a lazy singleton for Database. -------------

  getIt.registerLazySingleton<AppDatabase>(
    () => AppDatabase(),
  );

  /// ------------- Register a lazy singleton for Repositories. -------------

  getIt.registerLazySingleton<PostsRepository>(
    () => PostsRepository(getIt()),
  );

  getIt.registerLazySingleton<PostDetailsRepository>(
    () => PostDetailsRepository(getIt()),
  );

  /// ------------- Register a factory for BLOCs. -------------

  getIt.registerFactory<SplashBloc>(
    () => SplashBloc(),
  );

  getIt.registerFactory<PostsBloc>(
    () => PostsBloc(getIt(), getIt()),
  );

  getIt.registerFactory<PostDetailsBloc>(
    () => PostDetailsBloc(getIt(), getIt()),
  );
}
