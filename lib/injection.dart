import 'package:cerdastani/features/authentication/login/data/datasources/login_remote_data_source.dart';
import 'package:cerdastani/features/authentication/login/data/repositories/login_repository_impl.dart';
import 'package:cerdastani/features/authentication/login/domain/repository/login_repository.dart';
import 'package:cerdastani/features/authentication/login/domain/usecases/login_with_email_usecase.dart';
import 'package:cerdastani/features/authentication/login/presentation/bloc/login_bloc.dart';
import 'package:cerdastani/features/authentication/register/data/datasources/location/location_remote_data_source.dart';
import 'package:cerdastani/features/authentication/register/data/datasources/register_remote_data_source.dart';
import 'package:cerdastani/features/authentication/register/data/repositories/location/location_repository_impl.dart';
import 'package:cerdastani/features/authentication/register/data/repositories/register_repository_impl.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/location/location_repository.dart';
import 'package:cerdastani/features/authentication/register/domain/repository/register.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_cities_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_districts_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_provinces_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/location/get_subdistricts_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/register_with_email_and_password_usecase.dart';
import 'package:cerdastani/features/authentication/register/domain/usecase/save_user_register_usecase.dart';
import 'package:cerdastani/features/authentication/register/presentation/bloc/register_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/authentication/login/domain/usecases/login_with_google_usecase.dart';

var myInjection = GetIt.instance;

Future<void> init() async {
  //General Injection
  // myInjection.registerLazySingleton<NetworkManager>(() => NetworkManager());
  myInjection.registerLazySingleton<GetStorage>(() => GetStorage());
  myInjection.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  myInjection.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  myInjection.registerLazySingleton(() => Dio());
  myInjection.registerLazySingleton(() => FirebaseFirestore.instance);
  myInjection.registerLazySingleton(
      () => dotenv.load(fileName: "assets/env/.env_dev"));

  //FEATURE - LOGIN AUTHENTICATION
  //Bloc
  myInjection.registerFactory(() => LoginBloc(
        loginWithEmailUseCase: myInjection(),
        loginWithGoogleUseCase: myInjection(),
      ));
  //UseCase
  myInjection.registerLazySingleton(
    () => LoginWithEmailUseCase(loginRepository: myInjection()),
  );
  myInjection.registerLazySingleton(
    () => LoginWithGoogleUseCase(loginRepository: myInjection()),
  );
  //Repository
  myInjection.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImplementation(
            loginRemoteDataSource: myInjection(),
          ));
  // Data Source
  myInjection.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImplements(
            auth: myInjection(),
            googleSignIn: myInjection(),
          ));

  /// FEATURE - REGISTER AUTHENTICATION
  ///Bloc
  myInjection.registerFactory(() => RegisterBloc(
      registerWithEmailUseCase: myInjection(),
      saveUserRegisterUseCase: myInjection(),
      getProvincesUseCase: myInjection(),
      getCitiesUseCase: myInjection(),
      getDistrictsUseCase: myInjection(),
      getSubDistrictsUseCase: myInjection()));

  //UseCase
  myInjection.registerLazySingleton(
      () => RegisterWithEmailUseCase(registerRepository: myInjection()));
  myInjection.registerLazySingleton(
      () => SaveUserRegisterUseCase(registerRepository: myInjection()));
  myInjection.registerLazySingleton(
      () => GetProvincesUseCase(locationRepository: myInjection()));
  myInjection.registerLazySingleton(
      () => GetCitiesUseCase(locationRepository: myInjection()));
  myInjection.registerLazySingleton(
      () => GetDistrictsUseCase(locationRepository: myInjection()));
  myInjection.registerLazySingleton(
      () => GetSubDistrictsUseCase(locationRepository: myInjection()));

  //Repository
  myInjection.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDataSource: myInjection()));
  myInjection.registerLazySingleton<LocationRepository>(() =>
      LocationRepositoryImplementation(
          locationRemoteDataSource: myInjection()));

  //DataSource
  myInjection.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImplements(
            auth: myInjection(),
            db: myInjection(),
          ));
  myInjection.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImplements(dio: myInjection()));
}
