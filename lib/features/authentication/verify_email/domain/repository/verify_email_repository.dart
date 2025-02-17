import 'package:dartz/dartz.dart';

abstract class VerifyEmailRepository {
  Future<Either<String, void>> sendEmailVerification();
  Future<Either<String, bool>> checkEmailVerification();
}
