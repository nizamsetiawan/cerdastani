part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordStateLoading extends ForgotPasswordState {}

class ForgotPasswordStateRequested extends ForgotPasswordState {
  final String message;

  ForgotPasswordStateRequested(this.message);

  @override
  List<Object> get props => [message];
}

class ForgotPasswordStateResend extends ForgotPasswordState {
  final String message;

  ForgotPasswordStateResend(this.message);

  @override
  List<Object> get props => [message];
}

class ForgotPasswordStateError extends ForgotPasswordState {
  final String message;

  ForgotPasswordStateError(this.message);

  @override
  List<Object> get props => [message];
}
