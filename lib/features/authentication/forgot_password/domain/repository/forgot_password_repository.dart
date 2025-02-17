import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepository {
  Future<Either<String, void>> forgotPassword(String email);
}