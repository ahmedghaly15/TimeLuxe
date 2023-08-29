part of 'forgot_password_view_cubit.dart';

abstract class ForgotPasswordViewStates {}

final class ForgotPasswordViewCubitInitialState
    extends ForgotPasswordViewStates {}

final class ResetPasswordLoadingState extends ForgotPasswordViewStates {}

final class ResetPasswordSuccessState extends ForgotPasswordViewStates {}

final class ResetPasswordErrorState extends ForgotPasswordViewStates {
  final String error;
  ResetPasswordErrorState(this.error);
}
