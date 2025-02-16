import 'package:cerdastani/features/authentication/register/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.username,
      required super.email,
      required super.phoneNumber,
      required super.provinceId,
      required super.cityId,
      required super.districtId,
      required super.subDistrictId,
      required super.crops});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'provinceId': provinceId,
      'cityId': cityId,
      'districtId': districtId,
      'subDistrictId': subDistrictId,
      'crops': crops,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: data['id'],
        username: data['username'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        provinceId: data['provinceId'],
        cityId: data['cityId'],
        districtId: data['districtId'],
        subDistrictId: data['subDistrictId'],
        crops: data['crops'],
      );
    } else {
      return UserModel(
        id: '',
        username: '',
        email: '',
        phoneNumber: '',
        provinceId: '',
        cityId: '',
        districtId: '',
        subDistrictId: '',
        crops: '',
      );
    }
  }
}
