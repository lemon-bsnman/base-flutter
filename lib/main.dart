import 'package:base_app/api/api.dart';
import 'package:base_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:base_app/model/app_state.dart';
import 'package:base_app/redux/reducers.dart';
import 'package:base_app/redux/actions.dart';
import 'package:redux/redux.dart';

import 'api/repository/user_repository.dart';
import 'bloc/bloc.dart';

void main() {
  final _initialState = AppState(profileName: '');
  Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: BlocProvider(
          builder: (context) => UserBloc(
            APIUserRepository(MyAPI.api),
          ),
          child: MaterialApp(
            theme: ThemeData(
              accentColor: Colors.amber,
              primaryColor: Color(
                  int.parse("FF9C04".substring(0, 6), radix: 16) + 0xFF000000),
            ),
            onGenerateRoute: Routes.routes(),
          ),
        ));
  }
}
