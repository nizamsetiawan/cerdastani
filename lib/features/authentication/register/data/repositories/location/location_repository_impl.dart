import 'package:cerdastani/features/authentication/register/data/datasources/location/location_remote_data_source.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/location/city.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/location/district.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/location/province.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/location/sub_district.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/location/location_repository.dart';
import 'package:dartz/dartz.dart';

class LocationRepositoryImplementation extends LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;
  
  LocationRepositoryImplementation({
    required this.locationRemoteDataSource
});

  @override
  Future<Either<Exception, List<City>>> getCities(String provinceId) async {
   try {
     final response = await locationRemoteDataSource.getCities(provinceId);
     return Right(response);
   } catch (e) {
     return Left(Exception(e));
   }
  }

  @override
  Future<Either<Exception, List<District>>> getDistricts(String cityId) async {
   try {
     final response = await locationRemoteDataSource.getDistricts(cityId);
     return Right(response);
   } catch (e) {
     return Left(Exception(e));
   }
  }

  @override
  Future<Either<Exception, List<Province>>> getProvinces() async {
   try {
     final response = await locationRemoteDataSource.getProvinces();
     return Right(response);
   } catch (e) {
     return Left(Exception(e));
   }
  }

  @override
  Future<Either<Exception, List<SubDistrict>>> getSUbDistricts(String districtId) async {
   try {
     final response = await locationRemoteDataSource.getSubDistricts(districtId);
     return Right(response);
   } catch (e) {
     return Left(Exception(e));
   }
  }
}