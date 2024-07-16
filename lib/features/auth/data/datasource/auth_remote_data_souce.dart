import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:webuzz/core/error/exception.dart';
import 'package:webuzz/features/auth/data/model/user_model.dart';

import '../../../../core/helper/helper.dart';

abstract interface class AuthRemoteDataSource {
  User? get currentUser;
  Future<WebuzzUserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String program,
  });
  Future<WebuzzUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<WebuzzUserModel> signInWithGoogle();
  Future<WebuzzUserModel?> getCurrentUserData();
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;

  @override
  User? get currentUser => firebaseAuth.currentUser;

  @override
  Future<WebuzzUserModel?> getCurrentUserData() async {
    try {
      if (currentUser != null) {
        final result =
            await firestore.collection('users').doc(currentUser!.uid).get();

        return WebuzzUserModel.fromDocument(result);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
    required this.googleSignIn,
  });

  @override
  Future<WebuzzUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Authenticate user with firebase auth (Sign In)
      final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // throw exception when user is null
      if (response.user == null) {
        throw ServerException('User is null');
      }

      // Get user id
      String userId = response.user!.uid;

      // Get user document info
      final userDoc = await firestore.collection('users').doc(userId).get();

      if (userDoc.exists == false) {
        throw ServerException('User does not exit!');
      }

      return WebuzzUserModel.fromDocument(userDoc);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw ServerException('You have provided an invalid credential');
      } else if (e.code == 'invalid-email') {
        throw ServerException('You have use an invalid email');
      } else if (e.code == 'weak-password') {
        throw ServerException('Password is weak!');
      } else if (e.code == 'email-already-in-use') {
        throw ServerException('Email address taken!');
      } else if (e.code == 'wrong-password') {
        throw ServerException('Incorrect password!');
      } else if (e.code == 'user-not-found') {
        throw ServerException('No user corresponding to the given email');
      } else {
        throw ServerException('Something went wrong');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<WebuzzUserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String program,
  }) async {
    try {
      // Authenticate user in firebase auth
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // throw exception when user is null
      if (response.user == null) {
        throw ServerException("User is null");
      }

      // Get user id
      String userId = response.user!.uid;

      final user = WebuzzUserModel(
        userId: userId,
        email: email,
        name: name,
        username: Helper.usernameGenerator(email),
        lastActive: DateTime.now().millisecondsSinceEpoch.toString(),
        location: 'Kano',
        createdAt: Timestamp.now(),
      );

      // Create user in firestore
      await firestore.collection('users').doc(userId).set(user.toMap());

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw ServerException('You have provided an invalid credential');
      } else if (e.code == 'invalid-email') {
        throw ServerException('You have use an invalid email');
      } else if (e.code == 'weak-password') {
        throw ServerException('Password is weak!');
      } else if (e.code == 'email-already-in-use') {
        throw ServerException('Email address taken!');
      } else if (e.code == 'wrong-password') {
        throw ServerException('Incorrect password!');
      } else if (e.code == 'user-not-found') {
        throw ServerException('No user corresponding to the given email');
      } else {
        throw ServerException('Something went wrong');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<WebuzzUserModel> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw ServerException('Google user is null');
      }
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Authenticate user with firebase auth (Sign In)
      final response = await firebaseAuth.signInWithCredential(credential);

      // Get user id
      String userId = response.user!.uid;

      // Get user document info
      final userDoc = await firestore.collection('users').doc(userId).get();

      if (userDoc.exists == false) {
        throw ServerException('User does not exit!');
      }

      return WebuzzUserModel.fromDocument(userDoc);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      throw ServerException('Error signing user out');
    }
  }
}
