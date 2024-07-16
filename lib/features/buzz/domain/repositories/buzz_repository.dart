import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../model/webuzz.dart';

abstract interface class BuzzRepository {
  Future<Either<Failure, Webuzz>> uploadBuzz({
    File? image,
    required String authorId,
    required String content,
    required String location,
    required String buzzType,
    required List<String> hashtags,
    required List<String> links,
  });
}
