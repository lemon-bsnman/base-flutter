import 'package:base_app/api/model/model.dart';
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
  final Authenticate authenticate;

  const LoginLoaded(this.authenticate);

  @override
  List<Object> get props => [authenticate];
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);

  @override
  List<Object> get props => [message];
}
