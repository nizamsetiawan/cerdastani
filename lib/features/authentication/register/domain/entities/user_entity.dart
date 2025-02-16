import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final String email;
  final String phoneNumber;
  final String provinceId;
  final String cityId;
  final String districtId;
  final String subDistrictId;
  final String crops;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.provinceId,
    required this.cityId,
    required this.districtId,
    required this.subDistrictId,
    required this.crops,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    phoneNumber,
    provinceId,
    cityId,
    districtId,
    subDistrictId,
    crops
  ];
}