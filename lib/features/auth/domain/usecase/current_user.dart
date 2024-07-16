

import 'package:fpdart/fpdart.dart';


import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/common/entities/user.dart';
import '../repository/repository.dart';

class CurrentUser implements Usecase<WebuzzUser, NoParams> {
  final AuthRepository repository;

  CurrentUser(this.repository);
  @override
  Future<Either<Failure, WebuzzUser>> call(NoParams params) async{
    return await repository.currentUser();

  }
  
}

