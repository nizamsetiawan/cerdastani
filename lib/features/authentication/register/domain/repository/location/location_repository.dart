import 'package:cerdastani/features/authentication/register/domain/entities/location/district.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/location/sub_district.dart';
import 'package:dartz/dartz.dart';

import '../../entities/location/city.dart';
import '../../entities/location/province.dart';

abstract class LocationRepository {
  Future<Either<Exception, List<Province>>> getProvinces();

  Future<Either<Exception, List<City>>> getCities(String provinceId);

  Future<Either<Exception, List<District>>> getDistricts(String cityId);

  Future<Either<Exception, List<SubDistrict>>> getSUbDistricts(
      String districtId);
}
