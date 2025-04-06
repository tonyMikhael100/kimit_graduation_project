part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSignUpValidateState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSignUpSuccessState extends AuthState {}

final class AuthSignInSuccessState extends AuthState {}

final class AuthSignUpFailState extends AuthState {
  final String errMsg;
  AuthSignUpFailState({required this.errMsg});
}

final class AuthSignInFailState extends AuthState {
  final String errMsg;
  AuthSignInFailState({required this.errMsg});
  
}

final class AuthImageUploadedState extends AuthState {}

