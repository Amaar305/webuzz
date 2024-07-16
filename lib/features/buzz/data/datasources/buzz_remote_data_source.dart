import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/error/exception.dart';
import '../model/webuzz_model.dart';

abstract interface class BuzzRemoteDataSource {
  Future<WebuzzModel> uploadBuzz(WebuzzModel buzz);
  Future<String> uploadBuzzImage(File image, WebuzzModel buzz);
}

class BuzzRemoteDataSourceImpl implements BuzzRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  BuzzRemoteDataSourceImpl(
      {required this.firebaseFirestore, required this.firebaseStorage});

  @override
  Future<WebuzzModel> uploadBuzz(WebuzzModel buzz) async {
    try {
      final res = await firebaseFirestore.collection('buzz').add(buzz.toJson());
      final result = await res.get();

      return WebuzzModel.fromDocumentSnapshot(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadBuzzImage(File image, WebuzzModel buzz) async {
    try {
      Reference storageReference =
          firebaseStorage.ref().child('buzz_images/${buzz.id}');
      UploadTask uploadTask = storageReference.putFile(image);
      var taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
