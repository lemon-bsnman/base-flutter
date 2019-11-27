import 'package:base_app/api/repository/login_repository.dart';
import 'package:base_app/bloc/bloc.dart';
import 'package:base_app/widgets/login_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF9C04),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: BlocProvider(
                  builder: (context) => LoginBloc(
                    APILoginRepository(),
                  ),
                  child: LoginCard(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
