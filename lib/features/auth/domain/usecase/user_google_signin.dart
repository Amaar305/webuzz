import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entities/user.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/repository.dart';

class UserGoogleSignin implements Usecase<WebuzzUser, NoParams> {
  final AuthRepository repository;

  UserGoogleSignin(this.repository);

  @override
  Future<Either<Failure, WebuzzUser>> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}
