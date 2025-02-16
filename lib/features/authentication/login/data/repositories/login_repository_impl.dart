import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repository/login_repository.dart';
import '../datasources/login_remote_data_source.dart';

class LoginRepositoryImplementation extends LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImplementation({required this.loginRemoteDataSource});

  @override
  Future<Either<String, UserCredential>> loginWithEmailAndPassword(
      String email, String password)async {
    try {
      final result = await loginRemoteDataSource.loginWithEmailAndPassword(email, password);
      return right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserCredential?>> loginWithGoogleSignIn() async {
    try {
      final result = await loginRemoteDataSource.loginWithGoogleSignIn();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
