part of 'verify_email_bloc.dart';

sealed class VerifyEmailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailSent extends VerifyEmailState {
  final String message;
  VerifyEmailSent(this.message);

  @override
  List<Object> get props => [message];
}

class VerifyEmailSuccess extends VerifyEmailState {}

class VerifyEmailError extends VerifyEmailState {
  final String message;
  VerifyEmailError(this.message);

  @override
  List<Object> get props => [message];
}
