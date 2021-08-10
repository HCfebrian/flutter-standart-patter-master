abstract class AuthRepoAbs {
  Future registerUser({
    required String email,
    required String password,
    String? username,
  });

  Future loginUser({
    required String email,
    required String password,
    String? username,
  });
}
