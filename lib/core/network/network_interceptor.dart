
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter/feature/auth/presentation/bloc/user/bloc/user_bloc.dart';
import 'package:simple_flutter/injection_container.dart';

Dio addInterceptors({required Dio dio}) {
  print("interceptor initialized dio not null");
  return dio
    ..interceptors.add(
      InterceptorsWrapper(
          onRequest: (RequestOptions options,
                  RequestInterceptorHandler handler) async =>
              requestInterceptor(options, handler),
          // onResponse: (Response response) => responseInterceptor(response),
          onError: (DioError dioError, handler) =>
              errorInterceptor(dioError, handler)),
    );
}

dynamic requestInterceptor(
    RequestOptions options, RequestInterceptorHandler handler) async {
  {
    print("requestInterceptor active");
    print("request " + options.uri.toString());
    if (options.headers.containsKey("addToken")) {
      print("requires token active");
      options.headers.remove("addToken");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.get("addToken");
      options.headers["Authorization"] = "Bearer " + token.toString();
      return handler.next(options);
    }
    return handler.next(options);
  }
}

dynamic errorInterceptor(DioError dioError, handler) async {
  final UserBloc userBloc = getIt();

  print("Uri : " + dioError.requestOptions.uri.toString());
  if (dioError.response != null) {
    if (dioError.response!.data["error"]["message"] == "Token is expired") {
      final SharedPreferences sharedPreferences = getIt();
      sharedPreferences.setString("addToken", "");
      userBloc.add(UserLoggedOutEvent());
    }
    print("error interceptor " + dioError.response!.data.toString());
    return handler.next(dioError);
  }
  return handler.next(dioError);
}
