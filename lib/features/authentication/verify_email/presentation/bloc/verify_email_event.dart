part of 'verify_email_bloc.dart';

sealed class VerifyEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendEmailVerificationEvent extends VerifyEmailEvent {}

class CheckEmailVerificationEvent extends VerifyEmailEvent {}

class StartAutoCheckVerificationEvent extends VerifyEmailEvent {}
