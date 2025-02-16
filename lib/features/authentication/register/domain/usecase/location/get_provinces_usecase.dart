import 'package:cerdastani/features/authentication/register/domain/entities/location/province.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/location/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetProvincesUseCase {
  final LocationRepository locationRepository;

  GetProvincesUseCase({required this.locationRepository});

  Future<Either<Exception, List<Province>>> call() async {
    return await locationRepository.getProvinces();
  }
}
