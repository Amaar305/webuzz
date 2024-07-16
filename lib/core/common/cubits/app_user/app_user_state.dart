part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserInitial {
  final WebuzzUser user;

  AppUserLoggedIn({required this.user});
}

// core cannot depend on other features
// other features can depend on core