import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_luxe/features/auth/forgot_password/domain/forgot_password_repo.dart';

class ForgotPasswordRepoImpl extends ForgotPasswordRepo {
  @override
  Future<void> resetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
