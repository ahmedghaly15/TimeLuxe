import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_states.dart';

import '../../../../../core/network/local/cache_helper.dart';
import '../../domain/sign_in_repo.dart';

class SignInViewCubit extends Cubit<SignInViewStates> {
  SignInViewCubit(this.signInViewRepo) : super(SignInViewCubitInitialState());

  static SignInViewCubit getObject(context) => BlocProvider.of(context);

  SignInViewRepo signInViewRepo;

  bool passVisibility = true;

  void userSignIn({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(SignInLoadingState());

    signInViewRepo
        .userSignIn(
      email: email,
      password: password,
      context: context,
    )
        .then((value) {
      emit(SignInSuccessState(value.user!.uid));
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      // TODO: Do getUserData method
      // DelibirdAppCubit.getObject(context).getUserData(value.user!.uid);
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(SignInErrorState(error.code.toString()));
      }
    });
  }

  signInWithGoogle() {
    emit(SignInWithGoogleLoadingState());
    signInViewRepo.signInWithGoogle().then((value) {
      emit(SignInWithGoogleSuccessState(value.user!.uid));
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      // TODO: Do getUserData method
      // DelibirdAppCubit.getObject(context).getUserData(value.user!.uid);
    }).catchError((error) {
      emit(SignInWithGoogleErrorState(error.toString()));
    });
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState());
  }
}
