part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateEmpty extends LoginState {}

class LoginStateLoading extends LoginState {
  final String message;

  LoginStateLoading(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginStateSuccess extends LoginState {
  final UserCredential userCredential;

  LoginStateSuccess(this.userCredential);

  @override
  List<Object?> get props => [userCredential];
}

class LoginStateError extends LoginState {
  final String errorMessage;

  LoginStateError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
