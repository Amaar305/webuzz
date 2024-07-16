part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucess extends AuthState {
  final WebuzzUser user;

  AuthSucess({required this.user});
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}
