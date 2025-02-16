import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_entity.dart';

abstract class RegisterRepository {
  Future<Either<String, UserCredential>> registerWithEmailAndPassword(
      String email, String password);
  Future<Either<String, void>> saveUserRecord(UserEntity userEntity);
}
