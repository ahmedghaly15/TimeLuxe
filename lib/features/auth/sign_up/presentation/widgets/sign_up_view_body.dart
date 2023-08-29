import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/auth/sign_up/presentation/cubit/sign_up_view_cubit.dart';
import 'package:time_luxe/features/auth/sign_up/presentation/widgets/sign_up_form.dart';

import '../../../../../core/network/local/cache_helper.dart';
import '../../../sign_in/presentation/widgets/title_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpViewCubit, SignUpViewStates>(
      builder: (context, state) {
        SignUpViewCubit cubit = SignUpViewCubit.getObject(context);

        return SingleChildScrollView(
          child: SizedBox(
            // To allow using SingleChildScrollView Widget
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TitleText(title: "Let's Get Started"),
                SignUpForm(cubit: cubit, state: state),
              ],
            ),
          ),
        );
      },
      listener: (context, state) => controlSignUpViewStates(state, context),
    );
  }

  void controlSignUpViewStates(SignUpViewStates state, BuildContext context) {
    if (state is SignUpErrorState) {
      if (state.error == 'weak-password') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "Password is too weak",
          state: SnackBarStates.error,
          context: context,
        );
      } else if (state.error == 'email-already-in-use') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "Account already exists",
          state: SnackBarStates.error,
          context: context,
        );
      }
    }

    if (state is SignUpSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        // Todo: Navigate to HomeView
        // CustomNavigator.navigateAndFinishAll(screen: () => const LayoutView());
      });
      CustomHelper.buildSnackBar(
        title: "Success",
        message: "Account Created Successfully",
        state: SnackBarStates.success,
        context: context,
      );
    }

    if (state is CreateUserSuccessState) {
      // Todo: Navigate to HomeView
      // CustomNavigator.navigateAndFinishAll(screen: () => const LayoutView());
    }
  }
}
