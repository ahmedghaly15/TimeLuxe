import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_luxe/features/auth/forgot_password/domain/forgot_password_repo.dart';

part 'forgot_password_view_states.dart';

class ForgotPasswordViewCubit extends Cubit<ForgotPasswordViewStates> {
  ForgotPasswordViewCubit(this.forgotPasswordRepo)
      : super(ForgotPasswordViewCubitInitialState());

  static ForgotPasswordViewCubit getObject(context) => BlocProvider.of(context);

  ForgotPasswordRepo forgotPasswordRepo;

  void resetPassword({required String email}) {
    emit(ResetPasswordLoadingState());
    forgotPasswordRepo.resetPassword(email: email.trim()).then((value) {
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(ResetPasswordErrorState(error.code.toString()));
      }
    });
  }
}
