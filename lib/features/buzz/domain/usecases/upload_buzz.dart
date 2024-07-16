import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/webuzz.dart';
import '../repositories/buzz_repository.dart';

class UploadBuzzUsecase implements Usecase<Webuzz, UploadBuzzParams> {
  final BuzzRepository buzzRepository;

  UploadBuzzUsecase(this.buzzRepository);
  @override
  Future<Either<Failure, Webuzz>> call(UploadBuzzParams params) async {
    return await buzzRepository.uploadBuzz(
      image: params.image,
      authorId: params.authorId,
      content: params.content,
      location: params.location,
      buzzType: params.buzzType,
      hashtags: params.hashtags,
      links: params.links,
    );
  }
}

class UploadBuzzParams {
  final File? image;
  final String authorId;
  final String content;
  final String location;
  final String buzzType;
  final List<String> hashtags;
  final List<String> links;

  UploadBuzzParams({
    this.image,
    required this.authorId,
    required this.content,
    required this.location,
    required this.buzzType,
    required this.hashtags,
    required this.links,
  });
}
