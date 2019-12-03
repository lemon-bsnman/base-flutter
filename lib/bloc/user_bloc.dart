import 'dart:async';
import 'package:base_app/api/repository/login_repository.dart';
import 'package:base_app/api/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository);

  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    yield UserLoading();

    if (event is GetCurrentUser) {
      try {
        final user = await _userRepository.me();

        if (user.id == null) {
          yield UserError("Failed to get current user");
        } else {
          yield UserLoaded(user);
        }
      } on NetworkError {
        yield UserError("Failed to get current user");
      }
    }
  }
}
