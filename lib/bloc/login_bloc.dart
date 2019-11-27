import 'dart:async';
import 'package:base_app/api/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield LoginLoading();

    if (event is SendLogin) {
      final authenticateResponse =
          await _loginRepository.authenticate("username", "password");

      if (authenticateResponse == null) {
        yield LoginError("Login credential failed");
      } else {
        yield LoginLoaded(authenticateResponse);
      }
    }
  }
}
