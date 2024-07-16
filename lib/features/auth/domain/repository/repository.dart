import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/common/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, WebuzzUser>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String program,
    required String level,
  });
  Future<Either<Failure, WebuzzUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, WebuzzUser>> signInWithGoogle();
  Future<Either<Failure, WebuzzUser>> currentUser();

  Future<Either<Failure, String>> signOut();
}
