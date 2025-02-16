import 'package:cerdastani/features/authentication/register/domain/entities/location/sub_district.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/location/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetSubDistrictsUseCase {
  final LocationRepository locationRepository;

  GetSubDistrictsUseCase({required this.locationRepository});

  Future<Either<Exception, List<SubDistrict>>> call(String districtId) async {
    return await locationRepository.getSUbDistricts(districtId);
  }
}
