import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/helper/helper.dart';
import '../../domain/model/webuzz.dart';
import '../../domain/repositories/buzz_repository.dart';
import '../datasources/buzz_remote_data_source.dart';
import '../model/webuzz_model.dart';

class BuzzRepositoryImpl implements BuzzRepository {
  final BuzzRemoteDataSource buzzRemoteDataSource;

  BuzzRepositoryImpl(this.buzzRemoteDataSource);

  @override
  Future<Either<Failure, Webuzz>> uploadBuzz({
    File? image,
    required String authorId,
    required String content,
    required String location,
    required String buzzType,
    required List<String> hashtags,
    required List<String> links,
  }) async {
    try {
      WebuzzModel buzz = WebuzzModel(
        id: Helper.generatedId,
        authorId: authorId,
        content: content,
        createdAt: Timestamp.now(),
        buzzType: buzzType,
        source: Platform.isAndroid ? 'Android' : 'IOS',
        imageUrl: null,
        docId: '',
        originalId: '',
        hashtags: hashtags,
        location: location,
        links: links,
      );
      // Upload image to firebase
      String? imageUrl;
      if (image != null) {
        imageUrl = await buzzRemoteDataSource.uploadBuzzImage(image, buzz);
      }

      buzz = buzz.copyWith(imageUrl: imageUrl);

      final uploadedBuzz = await buzzRemoteDataSource.uploadBuzz(buzz);

      return right(uploadedBuzz);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
