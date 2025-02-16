import 'package:cerdastani/features/authentication/register/domain/entities/location/district.dart';

class DistrictModel extends District {
  DistrictModel(
      {required super.id, required super.name, required super.cityId});

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json["id"],
        cityId: json["regency_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regency_id": cityId,
        "name": name,
      };
}
