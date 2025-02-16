import 'package:cerdastani/features/authentication/register/data/model/location/city_model.dart';
import 'package:cerdastani/features/authentication/register/data/model/location/district_model.dart';
import 'package:cerdastani/features/authentication/register/data/model/location/province_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../model/location/sub_district_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<ProvinceModel>> getProvinces();
  Future<List<CityModel>> getCities(String provinceId);
  Future<List<DistrictModel>> getDistricts(String cityId);
  Future<List<SubDistrictModel>> getSubDistricts(String districtId);
}

class LocationRemoteDataSourceImplements implements LocationRemoteDataSource {
  final Dio dio;

  LocationRemoteDataSourceImplements({required this.dio});

  @override
  Future<List<ProvinceModel>> getProvinces() async {
    try {
      final response = await dio.get('${dotenv.env['BASE_URL']}/provinces.json');
      return (response.data as List).map((e) => ProvinceModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load provinces: $e");
    }
  }

  @override
  Future<List<CityModel>> getCities(String provinceId) async {
    try {
      final response = await dio.get('${dotenv.env['BASE_URL']}/regencies/$provinceId.json');
      return (response.data as List).map((e) => CityModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load cities: $e");
    }
  }

  @override
  Future<List<DistrictModel>> getDistricts(String cityId) async {
    try {
      final response = await dio.get('${dotenv.env['BASE_URL']}/districts/$cityId.json');
      return (response.data as List).map((e) => DistrictModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load districts: $e");
    }
  }

  @override
  Future<List<SubDistrictModel>> getSubDistricts(String districtId) async {
    try {
      final response = await dio.get('${dotenv.env['BASE_URL']}/villages/$districtId.json');
      return (response.data as List).map((e) => SubDistrictModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load subdistricts: $e");
    }
  }
}
