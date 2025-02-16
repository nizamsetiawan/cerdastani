import 'package:bloc/bloc.dart';
import 'package:cerdastani/features/authentication/login/domain/usecases/login_with_email_usecase.dart';
import 'package:cerdastani/features/authentication/login/domain/usecases/login_with_google_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithEmailUseCase loginWithEmailUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final GetStorage localStorage;

  LoginBloc({
    required this.loginWithEmailUseCase,
    required this.loginWithGoogleUseCase,
    required this.localStorage,
  }) : super(LoginStateEmpty()) {
    on<LoginWithEmailAndPasswordEvent>(_onLoginWithEmail);
    on<LoginWithGoogleEvent>(_onLoginWithGoogle);
  }

  Future<void> _onLoginWithEmail(
      LoginWithEmailAndPasswordEvent event, Emitter<LoginState> emit) async {
    emit(LoginStateLoading("Logging in..."));

    Either<String, UserCredential> result =
        await loginWithEmailUseCase.execute(event.email, event.password);

    result.fold(
      (failure) => emit(LoginStateError(failure)),
      (userCredential) {
        emit(LoginStateSuccess(userCredential));
      },
    );
  }

  Future<void> _onLoginWithGoogle(
      LoginWithGoogleEvent event, Emitter<LoginState> emit) async {
    emit(LoginStateLoading("Signing in with Google..."));

    Either<String, UserCredential?> result =
        await loginWithGoogleUseCase.execute();

    result.fold((failure) => emit(LoginStateError(failure)),
        (userCredential) => emit(LoginStateSuccess(userCredential!)));
  }
}
