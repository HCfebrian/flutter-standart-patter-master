import 'package:dio/dio.dart';
import 'package:simple_flutter/feature/auth/domain/contract_repo/auth_repo_abs.dart';

class AuthRepoImpl implements AuthRepoAbs {
  final Dio dio;
  late CancelToken cancelToken;

  AuthRepoImpl({required this.dio});

  @override
  Future<String> loginUser({
    required String email,
    required String password,
    String? username,
  }) async {
    cancelToken.whenCancel.then(
      (value) => {
        if (value.message == 'aborted')
          {
            throw Exception('login canceled'),
          }
      },
    );

    final data = FormData.fromMap({
      'email': email,
      'password': password,
      'username': username,
    });
    final result =
        await dio.post('/login', data: data, cancelToken: cancelToken);
    //todo: change token response format
    return result.data['data']['token'].toString();
  }

  @override
  Future<String> registerUser({
    required String email,
    required String password,
    String? username,
  }) async {
    cancelToken.whenCancel.then(
      (value) => {
        if (value.message == 'aborted')
          {
            throw Exception('register canceled'),
          }
      },
    );

    final data = FormData.fromMap({
      'email': email,
      'password': password,
      'username': username,
    });
    final result =
        await dio.post('/register', data: data, cancelToken: cancelToken);
    //todo: change token response format
    return result.data['data']['token'].toString();
  }

  @override
  Future cancelRequest() async {
    cancelToken.cancel('aborted');
  }
}
