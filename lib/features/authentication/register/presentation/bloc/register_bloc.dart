import 'package:bloc/bloc.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/location/province.dart';
import 'package:cerdastani/features/authentication/register/domain/entities/user_entity.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_cities_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_districts_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_provinces_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_subdistricts_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/register_with_email_and_password_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/save_user_register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/location/city.dart';
import '../../domain/entities/location/district.dart';
import '../../domain/entities/location/sub_district.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterWithEmailUseCase registerWithEmailUseCase;
  final SaveUserRegisterUseCase saveUserRegisterUseCase;
  final GetProvincesUseCase getProvincesUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  final GetDistrictsUseCase getDistrictsUseCase;
  final GetSubDistrictsUseCase getSubDistrictsUseCase;

  RegisterBloc(
      {required this.registerWithEmailUseCase,
      required this.saveUserRegisterUseCase,
      required this.getProvincesUseCase,
      required this.getCitiesUseCase,
      required this.getDistrictsUseCase,
      required this.getSubDistrictsUseCase})
      : super(RegisterStateInitial()) {
    on<RegisterWithEmailAndPasswordEvent>(_onRegisterWithEmailAndPassword);
    on<SaveUserRegisterEvent>(_onSaveUserRegisterEvent);
    on<GetProvincesEvent>(_onGetProvincesEvent);
    on<GetCitiesEvent>(_onGetCitiesEvent);
    on<GetDistrictsEvent>(_onGetDistricts);
    on<GetSubDistrictsEvent>(_onGetSubDistricts);
  }

  Future<void> _onRegisterWithEmailAndPassword(
      RegisterWithEmailAndPasswordEvent event,
      Emitter<RegisterState> emit) async {
    emit(RegisterStateLoading());
    final result = await registerWithEmailUseCase(event.email, event.password);
    result.fold(
      (failure) => emit(RegisterStateError(failure)),
      (userCredential) => emit(RegisterStateSuccess(userCredential)),
    );
  }

  Future<void> _onSaveUserRegisterEvent(
      SaveUserRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterStateLoading());
    final result = await saveUserRegisterUseCase(event.userEntity);
    result.fold((failure) => emit(RegisterStateError(failure)),
        (_) => emit(SaveUserStateSuccess()));
  }

  Future<void> _onGetProvincesEvent(
      GetProvincesEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterStateLoading());
    final result = await getProvincesUseCase();
    result.fold((failure) => emit(RegisterStateError(failure.toString())),
        (provinces) => emit(GetProvincesStateSuccess(provinces)));
  }

  Future<void> _onGetCitiesEvent(
      GetCitiesEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterStateLoading());
    final result = await getCitiesUseCase(event.provinceId);
    result.fold((failure) => emit(RegisterStateError(failure.toString())),
        (cities) => emit(GetCitiesStateSuccess(cities)));
  }

  Future<void> _onGetDistricts(
      GetDistrictsEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterStateLoading());
    final result = await getDistrictsUseCase(event.cityId);
    result.fold((failure) => emit(RegisterStateError(failure.toString())),
        (districts) => emit(GetDistrictsStateSuccess(districts)));
  }

  Future<void> _onGetSubDistricts(
      GetSubDistrictsEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterStateLoading());
    final result = await getSubDistrictsUseCase(event.districtId);
    result.fold(
      (failure) => emit(RegisterStateError(failure.toString())),
      (subDistricts) => emit(GetSubDistrictsStateSuccess(subDistricts)),
    );
  }
}
