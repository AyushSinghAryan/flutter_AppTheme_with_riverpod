abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SigInInvalidState extends SignInState {}

class SigInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;

  SignInErrorState(this.errorMessage);
}

class SignInLoadingState extends SignInState {}
