import 'package:cerdastani/features/authentication/forgot_password/data/datasource/forgot_password_data_source.dart';
import 'package:cerdastani/features/authentication/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordImplementation extends ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource forgotPasswordRemoteDataSource;

  ForgotPasswordImplementation({required this.forgotPasswordRemoteDataSource});

  @override
  Future<Either<String, void>> forgotPassword(String email) async {
    try {
      final result = await forgotPasswordRemoteDataSource.forgotPassword(email);
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }
}
