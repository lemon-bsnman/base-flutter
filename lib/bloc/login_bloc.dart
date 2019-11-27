import 'dart:async';
import 'package:base_app/api/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';
import 'dart:developer' as developer;

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
      try {
        final authenticateResponse =
            await _loginRepository.authenticate(event.username, event.password);

        if (authenticateResponse == null ||
            authenticateResponse.access_token == null) {
          yield LoginError("Invalid Credentials");
        } else {
          yield LoginLoaded(authenticateResponse);
        }
      } on NetworkError {
        yield LoginError("Invalid Credentials");
      }
    }
  }
}
