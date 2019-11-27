import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SendLogin extends LoginEvent {
  final String username;
  final String password;

  SendLogin(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
