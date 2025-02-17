import 'package:dartz/dartz.dart';
import '../repository/verify_email_repository.dart';

class CheckEmailVerificationUseCase {
  final VerifyEmailRepository repository;

  CheckEmailVerificationUseCase({required this.repository});

  Future<Either<String, bool>> call() async {
    return await repository.checkEmailVerification();
  }
}
