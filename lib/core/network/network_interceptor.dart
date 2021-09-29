import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter/feature/auth/presentation/bloc/user/user_bloc.dart';
import 'package:simple_flutter/injection_container.dart';

Dio addInterceptors({required final Dio dio}) {
  log('interceptor initialized dio not null');
  return dio
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          final RequestOptions options,
          final RequestInterceptorHandler handler,
        ) async =>
            requestInterceptor(options, handler),
        // onResponse: (Response response) => responseInterceptor(response),
        onError:
            (final DioError dioError, final ErrorInterceptorHandler handler) =>
                errorInterceptor(dioError, handler),
      ),
    );
}

dynamic requestInterceptor(
  final RequestOptions options,
  final RequestInterceptorHandler handler,
) async {
  {
    log('requestInterceptor active');
    log('request ${options.uri}');
    if (options.headers.containsKey('addToken')) {
      log('requires token active');
      options.headers.remove('addToken');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('addToken') ?? '';
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    }
    return handler.next(options);
  }
}

dynamic errorInterceptor(
  final DioError dioError,
  final ErrorInterceptorHandler handler,
) async {
  final UserBloc userBloc = getIt();

  log('Uri : ${dioError.requestOptions.uri}');
  if (dioError.response != null) {
    if (dioError.response!.data['error']['message'] == 'Token is expired') {
      final SharedPreferences sharedPreferences = getIt();
      sharedPreferences.setString('addToken', '');
      userBloc.add(UserLoggedOutEvent());
    }
    log('error interceptor ${dioError.response!.data}');
    return handler.next(dioError);
  }
  return handler.next(dioError);
}
