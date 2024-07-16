import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/common/entities/user.dart';
import '../repository/repository.dart';

class UserSignIn implements Usecase<WebuzzUser, SignInParams> {
  final AuthRepository repository;

  UserSignIn(this.repository);
  @override
  Future<Either<Failure, WebuzzUser>> call(SignInParams params) async {
    return await repository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
