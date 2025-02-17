import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/check_email_stream_usecase.dart';
import '../../domain/usecase/check_email_verify_usecase.dart';
import '../../domain/usecase/send_email_verify_usecase.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final SendEmailVerifyUseCase sendEmailVerifyUseCase;
  final CheckEmailVerificationUseCase checkEmailVerificationUseCase;
  final StartAutoCheckVerificationUseCase startAutoCheckVerificationUseCase;
  StreamSubscription<bool>? _emailCheckSubscription;

  VerifyEmailBloc({
    required this.sendEmailVerifyUseCase,
    required this.checkEmailVerificationUseCase,
    required this.startAutoCheckVerificationUseCase,
  }) : super(VerifyEmailInitial()) {
    on<SendEmailVerificationEvent>(_onSendEmailVerification);
    on<CheckEmailVerificationEvent>(_onCheckEmailVerification);
    on<StartAutoCheckVerificationEvent>(_onStartAutoCheckVerification);
  }

  Future<void> _onSendEmailVerification(
      SendEmailVerificationEvent event, Emitter<VerifyEmailState> emit) async {
    emit(VerifyEmailLoading());
    final result = await sendEmailVerifyUseCase();
    result.fold(
          (failure) => emit(VerifyEmailError(failure)),
          (_) => emit(VerifyEmailSent("Email verifikasi telah dikirim.")),
    );
  }

  Future<void> _onCheckEmailVerification(
      CheckEmailVerificationEvent event, Emitter<VerifyEmailState> emit) async {
    final result = await checkEmailVerificationUseCase();
    result.fold(
          (failure) => emit(VerifyEmailError(failure)),
          (isVerified) {
        if (isVerified) {
          emit(VerifyEmailSuccess());
        } else {
          emit(VerifyEmailError("Email belum diverifikasi."));
        }
      },
    );
  }

  void _onStartAutoCheckVerification(
      StartAutoCheckVerificationEvent event, Emitter<VerifyEmailState> emit) {
    _emailCheckSubscription?.cancel();
    _emailCheckSubscription =
        startAutoCheckVerificationUseCase().listen((isVerified) {
          if (isVerified) {
            add(CheckEmailVerificationEvent());
          }
        });
  }

  @override
  Future<void> close() {
    _emailCheckSubscription?.cancel();
    return super.close();
  }
}
