import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter/core/utils/flavour_config.dart';
import 'package:simple_flutter/feature/auth/domain/usecase/auth_usecase.dart';
import 'package:simple_flutter/feature/auth/presentation/bloc/user/bloc/user_bloc.dart';

final getIt = GetIt.instance;

void initDepInject() {
  print("init run");
// Feature
  //bloc
  getIt.registerFactory(() => UserBloc(sharedPreferences: getIt()));

  //UseCase

  getIt.registerLazySingleton(() => AuthUsecase(authRepo: getIt()));

  // repo

  // getIt.registerLazySingleton<AuthRepoAbs>(
  //     () => BannerRepoImpl(bannerRemote: getIt()));

  //data
  //
  // getIt.registerLazySingleton<BannerRemoteAbs>(
  //     () => BannerRemoteImpl(dio: getIt()));

// Shared
  //feature.history.presentation

  //util

  //network

// External Dependency
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  // getIt.registerLazySingleton(() => ImagePicker());
  // getIt.registerLazySingleton<FirebaseMessaging>(
  //         () => FirebaseMessaging.instance);

  print("real api dio");
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
          baseUrl:
              // FlavorConfig.instance != null?
              FlavorConfig.instance.values.baseUrl
          // : StaticConstant.baseUrlDev
          ),
    ),
  );
}
