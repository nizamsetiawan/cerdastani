part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterStateInitial extends RegisterState {}

class RegisterStateLoading extends RegisterState {
}

class RegisterStateSuccess extends RegisterState {
  final UserCredential userCredential;

  RegisterStateSuccess(this.userCredential);

  @override
  List<Object> get props => [userCredential];
}

class SaveUserStateSuccess extends RegisterState {}

class RegisterStateError extends RegisterState {
  final String message;

  RegisterStateError(this.message);

  @override
  List<Object> get props => [message];
}

class GetProvincesStateSuccess extends RegisterState {
  final List<Province> provinces;

  GetProvincesStateSuccess(this.provinces);

  @override
  List<Object> get props => [provinces];
}

class GetCitiesStateSuccess extends RegisterState {
  final List<City> cities;

  GetCitiesStateSuccess(this.cities);

  @override
  List<Object> get props => [cities];
}

class GetDistrictsStateSuccess extends RegisterState {
  final List<District> districts;

  GetDistrictsStateSuccess(this.districts);

  @override
  List<Object> get props => [districts];
}

class GetSubDistrictsStateSuccess extends RegisterState {
  final List<SubDistrict> subDistricts;

  GetSubDistrictsStateSuccess(this.subDistricts);

  @override
  List<Object> get props => [subDistricts];
}