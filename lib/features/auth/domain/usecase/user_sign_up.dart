import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/common/entities/user.dart';
import '../repository/repository.dart';

class UserSignUp implements Usecase<WebuzzUser, SignUpParams> {
  final AuthRepository repository;

  UserSignUp(this.repository);

  @override
  Future<Either<Failure, WebuzzUser>> call(SignUpParams params) async {
    return await repository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
      program: params.program,
      level: params.level,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String program;
  final String level;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.program,
    required this.level,
  });
}
