import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/repository.dart';

class SignOut implements Usecase<String, NoParams> {
  final AuthRepository repository;

  SignOut(this.repository);
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.signOut();
  }
}
