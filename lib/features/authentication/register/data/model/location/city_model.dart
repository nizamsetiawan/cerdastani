import 'package:cerdastani/features/authentication/register/domain/entities/location/city.dart';

class CityModel extends City {
  CityModel(
      {required super.id, required super.name, required super.provinceId});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
      };
}
