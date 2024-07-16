part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String program;
  final String level;

  AuthSignUp({
    required this.name,
    required this.email,
    required this.password,
    required this.program,
    required this.level,
  });
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({
    required this.email,
    required this.password,
  });
}

final class AuthIsUserLoggedIn extends AuthEvent {}

final class AuthUserLogout extends AuthEvent {}

final class AuthGooleSignIn extends AuthEvent {}
