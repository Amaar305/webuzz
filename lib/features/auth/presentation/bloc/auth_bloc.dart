import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../../../core/common/entities/user.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecase/current_user.dart';
import '../../domain/usecase/user_google_signin.dart';
import '../../domain/usecase/user_sign_in.dart';
import '../../domain/usecase/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final UserGoogleSignin _googleSignin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  // final SignOut _signOut;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required UserGoogleSignin googleSignin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
    // required SignOut signOut,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _googleSignin = googleSignin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        // _signOut = signOut,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthSignIn);
    on<AuthGooleSignIn>(_onGoogleSignIn);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
    on<AuthUserLogout>(_onAuthLogout);
  }

  void _onAuthSignIn(AuthLogin event, Emitter<AuthState> emit) async {
    final res = await _userSignIn(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(error: l.message)),
      (r) => _emitAuthSucess(r, emit),
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp.call(
      SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
        program: event.program,
        level: event.level,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(error: l.message)),
      (r) => _emitAuthSucess(r, emit),
    );
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (l) => emit(AuthFailure(error: l.message)),
      (r) => _emitAuthSucess(r, emit),
    );
  }

  void _emitAuthSucess(WebuzzUser user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSucess(user: user));
  }

  void _onGoogleSignIn(AuthGooleSignIn event, Emitter<AuthState> emit) async {
    final res = await _googleSignin(NoParams());

    res.fold(
      (l) => emit(AuthFailure(error: l.message)),
      (r) => _emitAuthSucess(r, emit),
    );
  }

  void _onAuthLogout(_, Emitter<AuthState> emit) {
    _appUserCubit.logout();
    emit(AuthInitial());
  }
}
