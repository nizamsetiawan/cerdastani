import 'package:cerdastani/features/authentication/verify_email/data/datasource/verify_email_remote_data_source.dart';
import 'package:cerdastani/features/authentication/verify_email/domain/repository/verify_email_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyEmailImpl extends VerifyEmailRepository {
  final VerifyEmailRemoteDataSource verifyEmailRemoteDataSource;

  VerifyEmailImpl({required this.verifyEmailRemoteDataSource});

  @override
  Future<Either<String, void>> sendEmailVerification() async {
    try {
          await verifyEmailRemoteDataSource.verifyEmailRemoteDataSource();
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> checkEmailVerification() async {
    try {
      final result = await verifyEmailRemoteDataSource.checkEmailVerification();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

}
