import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter/feature/splash_screen/domain/usecase/splash_usecase.dart';
import 'package:simple_flutter/feature/splash_screen/presentation/bloc/splashscreen_bloc.dart';

final getIt = GetIt.instance;

void initDepInject() {
// Feature
  //bloc
  getIt.registerFactory(() => SplashScreenBloc(splashUsecase: getIt()));

  //UseCase

  getIt.registerLazySingleton(() => SplashUsecase());

  // repo

  // getIt.registerLazySingleton<BannerRepoAbs>(
  //     () => BannerRepoImpl(bannerRemote: getIt()));

  //data

  // getIt.registerLazySingleton<BannerRemoteAbs>(
  //     () => BannerRemoteImpl(dio: getIt()));

// Shared
  //feature.history.presentation

  //util

  //network

// External Dependency
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => SharedPreferences.getInstance(),
  );

  // getIt.registerLazySingleton(
  //   () => Dio(
  //     BaseOptions(
  //         baseUrl:
  //             // FlavorConfig.instance != null?
  //             FlavorConfig.instance!.values.baseUrl
  //         // : StaticConstant.baseUrlDev
  //         ),
  //   ),
  // );
}
