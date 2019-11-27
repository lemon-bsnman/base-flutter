import 'package:base_app/api/repository/login_repository.dart';
import 'package:base_app/bloc/bloc.dart';
import 'package:base_app/widgets/login_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:base_app/model/app_state.dart';
import 'package:base_app/redux/reducers.dart';
import 'package:base_app/redux/actions.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setProfileName("Sample Name2");
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFFFF9C04),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: BlocProvider(
                          builder: (context) => LoginBloc(
                            APILoginRepository(),
                          ),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => setProfileName('Another Sample Name'),
                                child: Text('Sample'),
                              ),
                              Text(state.profileName),
                              LoginCard(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void getProfileName() {
    print('>>>>>>Profile Name:' +
        StoreProvider.of<AppState>(context).state.profileName);
  }

  void setProfileName(v) {
    StoreProvider.of<AppState>(context).dispatch(ProfileName(v));
  }
}
