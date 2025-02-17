import 'dart:async';
import '../repository/verify_email_repository.dart';

class StartAutoCheckVerificationUseCase {
  final VerifyEmailRepository repository;

  StartAutoCheckVerificationUseCase({required this.repository});

  Stream<bool> call() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 3));
      final result = await repository.checkEmailVerification();
      yield result.fold((_) => false, (isVerified) => isVerified);
    }
  }
}
