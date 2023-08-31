abstract class ForgotPasswordRepo {
  Future<void> resetPassword({required String email});
}
