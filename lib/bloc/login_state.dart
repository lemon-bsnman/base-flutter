import 'package:base_app/api/model/response/authenticate_response.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<Object> get props => null;
}

class LoginLoaded extends LoginState {
  final AuthenticateResponse authenticateResponse;

  const LoginLoaded(this.authenticateResponse);

  @override
  List<Object> get props => [authenticateResponse];
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);

  @override
  List<Object> get props => [message];
}
