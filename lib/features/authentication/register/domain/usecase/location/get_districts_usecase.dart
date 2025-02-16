import 'package:cerdastani/features/authentication/register/domain/entities/location/district.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/location/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetDistrictsUseCase {
  final LocationRepository locationRepository;

  GetDistrictsUseCase ({
    required this.locationRepository
});

  Future<Either<Exception, List<District>>> call(String cityId) async {
    return await locationRepository.getDistricts(cityId);
  }
}