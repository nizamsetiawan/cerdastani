import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<Either<String, UserCredential>> loginWithEmailAndPassword(String email, String password);
  Future<Either<String, UserCredential?>> loginWithGoogleSignIn();
}
