import 'package:bloc/bloc.dart';
import 'package:cerdastani/features/authentication/forgot_password/domain/usecase/forgot_password_usecase.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseSase forgotPasswordUseCase;

  ForgotPasswordBloc({required this.forgotPasswordUseCase})
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<ForgotPasswordResend>(_onForgotPasswordResend);
  }

  Future<void> _onForgotPasswordRequested(
      ForgotPasswordRequested event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordStateLoading());
    final result = await forgotPasswordUseCase(event.email);
    result.fold(
        (failure) => emit(ForgotPasswordStateError(failure)),
        (_) => emit(ForgotPasswordStateRequested(
            "Silakan cek email Anda untuk reset password")));
  }

  Future<void> _onForgotPasswordResend(
      ForgotPasswordResend event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordStateLoading());
    final result = await forgotPasswordUseCase(event.email);
    result.fold(
            (failure) => emit(ForgotPasswordStateError(failure)),
            (_) => emit(ForgotPasswordStateResend(
            "Email reset password telah dikirim ulang. Silakan periksa email Anda.")));
  }
}
