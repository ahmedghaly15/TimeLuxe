abstract class SignInViewStates {}

class SignInViewCubitInitialState extends SignInViewStates {}

class SignInLoadingState extends SignInViewStates {}

class SignInSuccessState extends SignInViewStates {
  final String uId;
  SignInSuccessState(this.uId);
}

class SignInErrorState extends SignInViewStates {
  final String error;
  SignInErrorState(this.error);
}

class SignInWithGoogleLoadingState extends SignInViewStates {}

class SignInWithGoogleSuccessState extends SignInViewStates {
  final String uId;
  SignInWithGoogleSuccessState(this.uId);
}

class SignInWithGoogleErrorState extends SignInViewStates {
  final String error;
  SignInWithGoogleErrorState(this.error);
}

class FirestoreSaveUserSuccessState extends SignInViewStates {}

class FirestoreSaveUserErrorState extends SignInViewStates {
  final String error;
  FirestoreSaveUserErrorState(this.error);
}

class SwitchPassVisibleState extends SignInViewStates {}
