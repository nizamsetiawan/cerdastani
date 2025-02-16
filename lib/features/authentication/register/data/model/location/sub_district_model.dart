import 'package:cerdastani/features/authentication/register/domain/entities/location/sub_district.dart';

class SubDistrictModel extends SubDistrict {
  SubDistrictModel(
      {required super.id, required super.name, required super.districtId});

  factory SubDistrictModel.fromJson(Map<String, dynamic> json) =>
      SubDistrictModel(
        id: json["id"],
        districtId: json["district_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_id": districtId,
        "name": name,
      };
}
