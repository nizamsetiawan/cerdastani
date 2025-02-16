import 'package:firebase_auth/firebase_auth.dart';

import '../repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginWithEmailUseCase {
  final LoginRepository loginRepository;

  const LoginWithEmailUseCase({required this.loginRepository});

  Future<Either<String, UserCredential>> execute(String email,
      String password) async {
    return await loginRepository.loginWithEmailAndPassword(email, password);
  }
}

