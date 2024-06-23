abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValues;
  final String passwordValues;

  SignInTextChangeEvent(this.emailValues, this.passwordValues);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmittedEvent(this.email, this.password);
}
