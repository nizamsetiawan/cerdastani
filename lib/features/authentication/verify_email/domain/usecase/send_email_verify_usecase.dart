import 'package:cerdastani/features/authentication/verify_email/domain/repository/verify_email_repository.dart';
import 'package:dartz/dartz.dart';

class SendEmailVerifyUseCase {
  final VerifyEmailRepository verifyEmailRepository;

  SendEmailVerifyUseCase({required this.verifyEmailRepository});

  Future<Either<String, void>> call() async {
    return await verifyEmailRepository.sendEmailVerification();
  }
}
