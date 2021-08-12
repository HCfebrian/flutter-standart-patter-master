import 'package:simple_flutter/feature/auth/domain/contract_repo/auth_repo_abs.dart';

class AuthUsecase {
  final AuthRepoAbs authRepo;

  AuthUsecase({required this.authRepo});

  Future registerUser({
    required String email,
    required String password,
    String? username,
  }) {
    return authRepo.registerUser(email: email, password: password);
  }

  Future loginUser({
    required String email,
    required String password,
  }) {
    return authRepo.loginUser(email: email, password: password);
  }
}
