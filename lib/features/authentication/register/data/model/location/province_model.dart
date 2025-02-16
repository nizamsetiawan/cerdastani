import 'package:cerdastani/features/authentication/register/domain/entities/location/province.dart';

class ProvinceModel extends Province {
  const ProvinceModel({
    required super.id,
    required super.name,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
