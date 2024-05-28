part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LodinSuccess extends LoginState {
  final UserModel user;
  LodinSuccess(this.user);
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

final class PasswordVisibility extends LoginState {}
