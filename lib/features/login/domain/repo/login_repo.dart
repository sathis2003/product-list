abstract class LoginRepo{
  Future<bool> login({
    required String email,
  required String password,
});
}