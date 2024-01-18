abstract class AuthRepository {
  Future<void> signUp(
      String name, String email, String password, String confirmPassword);

  Future<void> signInWithEmailAndPasswordRepository(
      String email, String password);

  Future<void> signInWithGoogle();

  Future<void> logOut();
}
