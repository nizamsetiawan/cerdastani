import 'package:cerdastani/features/authentication/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseSase {
  final ForgotPasswordRepository forgotPasswordRepository;

  ForgotPasswordUseSase({required this.forgotPasswordRepository});

  Future<Either<String, void>> call(String email) async {
    return await forgotPasswordRepository.forgotPassword(email);
  }
}
