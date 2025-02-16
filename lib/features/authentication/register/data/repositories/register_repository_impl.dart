import 'package:cerdastani/features/authentication/register/data/datasources/register_remote_data_source.dart';
import 'package:cerdastani/features/authentication/register/data/model/user_model.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/user_entity.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/register.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImpl({
    required this.registerRemoteDataSource
  });

  @override
  Future<Either<String, UserCredential>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await registerRemoteDataSource
          .registerWithEmailAndPassword(email, password);
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> saveUserRecord(UserEntity userEntity) async {
    try {
      final userModel = UserModel(id: userEntity.id,
        username: userEntity.username,
        email: userEntity.email,
        phoneNumber: userEntity.phoneNumber,
        provinceId: userEntity.provinceId,
        cityId: userEntity.cityId,
        districtId: userEntity.cityId,
        subDistrictId: userEntity.subDistrictId,
        crops: userEntity.crops,);
      await registerRemoteDataSource.saveUserRecord(userModel);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}