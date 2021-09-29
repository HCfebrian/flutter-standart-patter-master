import 'package:simple_flutter/feature/auth/domain/contract_repo/auth_repo_abs.dart';

class AuthUsecase {
  final AuthRepoAbs authRepo;

  AuthUsecase({required final this.authRepo});

  Future<bool> registerUser({
    required final String email,
    required final String password,
    final String? username,
  }) {
    return authRepo.registerUser(email: email, password: password);
  }

  Future loginUser({
    required final String email,
    required final String password,
  }) {
    return authRepo.loginUser(email: email, password: password);
  }
}
