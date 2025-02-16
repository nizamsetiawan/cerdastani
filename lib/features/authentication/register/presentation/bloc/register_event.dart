part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterWithEmailAndPasswordEvent extends RegisterEvent {
  final String email;
  final String password;

  RegisterWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class SaveUserRegisterEvent extends RegisterEvent {
  final UserEntity userEntity;

  SaveUserRegisterEvent({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class GetProvincesEvent extends RegisterEvent {}

class GetCitiesEvent extends RegisterEvent {
  final String provinceId;

  GetCitiesEvent({required this.provinceId});

  @override
  List<Object?> get props => [provinceId];
}

class GetDistrictsEvent extends RegisterEvent {
  final String cityId;

  GetDistrictsEvent({required this.cityId});

  @override
  List<Object?> get props => [cityId];
}

class GetSubDistrictsEvent extends RegisterEvent {
  final String districtId;

  GetSubDistrictsEvent({required this.districtId});

  @override
  List<Object?> get props => [districtId];
}
