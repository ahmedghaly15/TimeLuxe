import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

import '../../../../../../../core/network/local/cache_helper.dart';
import '../../domain/sign_up_view_repo.dart';

part 'sign_up_view_states.dart';

class SignUpViewCubit extends Cubit<SignUpViewStates> {
  SignUpViewCubit(this.signUpViewRepo) : super(SignUpViewInitialState());

  static SignUpViewCubit getObject(context) => BlocProvider.of(context);

  SignUpViewRepo signUpViewRepo;

  bool passVisibility = true;
  bool confirmPassVisibility = true;

  void userSignUp({
    required String username,
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(SignUpLoadingState());

    signUpViewRepo
        .userSignUp(
      username: username,
      email: email,
      password: password,
      context: context,
    )
        .then((value) {
      firestoreCreateUser(
        name: username,
        email: email,
        uId: value.user!.uid,
      );
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      TimeLuxeCubit.getObject(context).getUserData(value.user!.uid);
    }).catchError((error) {
      debugPrint("ERROR: ${error.toString()}");
      if (error is FirebaseAuthException) {
        emit(SignUpErrorState(error.code.toString()));
      }
    });
  }

  void firestoreCreateUser({
    required String name,
    required String email,
    required String uId,
  }) {
    signUpViewRepo
        .firestoreCreateUSer(
      name: name,
      email: email,
      uId: uId,
    )
        .then((value) {
      emit(CreateUserSuccessState());
      emit(SignUpSuccessState(uId));
    }).catchError((error) {
      debugPrint("ERROR: ${error.toString()}");
      CreateUserErrorState(error.toString());
    });
  }

  signInWithGoogle(context) {
    emit(SignInWithGoogleLoadingState());
    signUpViewRepo.signInWithGoogle().then((value) {
      emit(SignInWithGoogleSuccessState(value.user!.uid));
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      TimeLuxeCubit.getObject(context).getUserData(value.user!.uid);
    }).catchError((error) {
      debugPrint("ERROR: ${error.toString()}");
      emit(SignInWithGoogleErrorState(error.toString()));
    });
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState());
  }

  void switchConfirmPassVisibility() {
    confirmPassVisibility = !confirmPassVisibility;
    emit(SwitchConfirmPassVisibleState());
  }
}
