part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordRequested extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordRequested({required this.email});

  @override
  List<Object?> get props => [email];
}
class ForgotPasswordResend extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordResend({required this.email});

  @override
  List<Object?> get props => [email];
}
