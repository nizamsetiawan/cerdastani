import 'package:cerdastani/features/authentication/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginWithGoogleUseCase {
  final LoginRepository loginRepository;

  const LoginWithGoogleUseCase ({required this.loginRepository});

  Future<Either<String, UserCredential?>> execute() async {
    return loginRepository.loginWithGoogleSignIn();
  }
}