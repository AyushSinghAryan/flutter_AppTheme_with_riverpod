import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:learning_dart/API/form_validation_using_bloc/SignIn/bloc/sign_in_event.dart';
import 'package:learning_dart/API/form_validation_using_bloc/SignIn/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>(
      (event, emit) {
        if (EmailValidator.validate(event.emailValues) == false) {
          emit(SignInErrorState("Please enter a valid Email Address"));
        } else if (event.passwordValues.length < 8) {
          emit(SignInErrorState("Please enter a valid Password"));
        } else {
          emit(SigInValidState());
        }
      },
    );
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
