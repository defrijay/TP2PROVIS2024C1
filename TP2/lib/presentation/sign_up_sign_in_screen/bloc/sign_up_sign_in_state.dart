// ignore_for_file: must_be_immutable

part of 'sign_up_sign_in_bloc.dart';

/// Represents the state of SignUpSignIn in the application.
class SignUpSignInState extends Equatable {
  SignUpSignInState({
    this.emailController,
    this.passwordController,
    this.signUpSignInModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  SignUpSignInModel? signUpSignInModelObj;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        signUpSignInModelObj,
      ];

  SignUpSignInState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    SignUpSignInModel? signUpSignInModelObj,
  }) {
    return SignUpSignInState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      signUpSignInModelObj: signUpSignInModelObj ?? this.signUpSignInModelObj,
    );
  }
}
