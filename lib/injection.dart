import 'package:cerdastani/features/authentication/login/data/datasources/login_remote_data_source.dart';
import 'package:cerdastani/features/authentication/login/data/repositories/login_repository_impl.dart';
import 'package:cerdastani/features/authentication/login/domain/repository/login_repository.dart';
import 'package:cerdastani/features/authentication/login/domain/usecases/login_with_email_usecase.dart';
import 'package:cerdastani/features/authentication/login/presentation/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  //FEATURE - LOGIN AUTHENTICATION
  //Bloc
  myInjection.registerFactory(() => LoginBloc(
        loginWithEmailUseCase: myInjection(),
        loginWithGoogleUseCase: myInjection(),
        localStorage: myInjection(),
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
}
