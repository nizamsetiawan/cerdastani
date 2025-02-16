import 'package:cerdastani/features/authentication/register/domain/entities/location/city.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/location/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetCitiesUseCase {
  final LocationRepository locationRepository;

  GetCitiesUseCase({
    required this.locationRepository
});

  Future<Either<Exception, List<City>>> call(String provinceId) async {
    return await locationRepository.getCities(provinceId);
  }
}