abstract class AuthRepoAbs {
  Future<bool> registerUser({
    required final String email,
    required final String password,
    final String? username,
  });

  Future loginUser({
    required final String email,
    required final String password,
    final String? username,
  });
}
