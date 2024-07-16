import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:webuzz/core/common/entities/user.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/repository.dart';
import '../datasource/auth_remote_data_souce.dart';
import '../model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, WebuzzUser>> currentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User is not logged in'));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, WebuzzUserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, WebuzzUserModel>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String program,
    required String level,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
        program: program,
      ),
    );
  }

  // Reusable encapsolated function, takes function that will return webuzzModel (callback)
  Future<Either<Failure, WebuzzUserModel>> _getUser(
    Future<WebuzzUserModel> Function() fn,
  ) async {
    try {
      final user = await fn();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, WebuzzUser>> signInWithGoogle() async {
    return _getUser(
      () async => await remoteDataSource.signInWithGoogle(),
    );
  }

  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return right('Logged out');
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
