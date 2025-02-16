import 'package:cerdastani/features/authentication/register/domain/repository/register.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterWithEmailUseCase {
  final RegisterRepository registerRepository;

  const RegisterWithEmailUseCase({required this.registerRepository});

  Future<Either<String, UserCredential>> call(
      String email, String password) async {
    return await registerRepository.registerWithEmailAndPassword(
        email, password);
  }
}
