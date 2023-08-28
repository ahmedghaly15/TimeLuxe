import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/widgets/sign_in_form.dart';

import '../../../../../core/network/local/cache_helper.dart';
import '../cubit/sign_in_cubit.dart';
import '../cubit/sign_in_states.dart';
import 'title_text.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewCubit, SignInViewStates>(
      listener: (context, state) => controlSignInViewStates(state, context),
      builder: (context, state) {
        SignInViewCubit cubit = SignInViewCubit.getObject(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TitleText(
              title: "Please Sign in",
            ),
            SignInForm(cubit: cubit),
          ],
        );
      },
    );
  }

  void controlSignInViewStates(SignInViewStates state, BuildContext context) {
    if (state is SignInErrorState) {
      if (state.error == 'user-not-found') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "No user found for that email",
          state: SnackBarStates.error,
          context: context,
        );
      } else if (state.error == 'wrong-password') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "Wrong Password",
          state: SnackBarStates.error,
          context: context,
        );
      }
    }

    if (state is SignInSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        //TODO: navigate to Home
        // CustomNavigator.navigateAndFinish(screen: () => const LayoutView());
      });
    }

    if (state is SignInWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        //TODO: navigate to Home
        // CustomNavigator.navigateAndFinish(screen: () => const LayoutView());
      });
    }
  }
}
