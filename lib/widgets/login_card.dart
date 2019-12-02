import 'package:base_app/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_app/routes.dart';
import 'package:base_app/prefs/preferences.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  static final Key _formKey = Key("LoginCardKey");

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAccessTokenFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, LoginState state) {
          return buildInitial(context);
        },
      ),
    );
  }

  Widget buildInitial(BuildContext context) {
    Widget accessToken = Text("no token");

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Image.asset('assets/images/optx-logo.png'),
          ),
          Center(
            child: Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "Username",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    BlocListener<LoginBloc, LoginState>(
                      listener: (BuildContext context, LoginState state) {
                        if (state is LoginLoaded) {
                          successLogin(state.authenticate.accessToken);
                          // TODO: save to shared pref? redux?
                          // then trigger an event? that makes the router check if sharedPref access_token is available, if yes, replace route to dashboard
                        } else if (state is LoginError) {
                          final message = state.message;

                          final snackBar = SnackBar(content: Text(message));

                          // Find the Scaffold in the widget tree and use it to show a SnackBar.
                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (BuildContext context, LoginState state) {
                          if (state is LoginLoading) {
                            return RaisedButton(
                              color: Color(0xFFFAAD14),
                              child: CircularProgressIndicator(),
                              onPressed: null,
                            );
                          } else if (state is LoginLoaded) {
                            return RaisedButton(
                              color: Color(0xFFFAAD14),
                              child: Text(state.authenticate.accessToken),
                              onPressed: null,
                            );
                          }
                          return RaisedButton(
                            color: Color(0xFFFAAD14),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () => onLogin(context),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onLogin(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    // Navigator.pushReplacementNamed(
    //   context,
    //   ProfileRoute,
    // );
    // Navigator.pushNamed(context, ProfileRoute);
    final username = _usernameController.text;
    final password = _passwordController.text;

    loginBloc.add(SendLogin(username, password));
  }

  void getAccessTokenFromPrefs() async {
    await Prefs.accessToken.then((value) {
      print('Access Token: "${value}"');
      if (value != null && value != '') {
        Navigator.pushReplacementNamed(
          context,
          ProfileRoute,
        );
      }
    });
  }

  void setAccessTokenToPrefs(v) async {
    print('>>>>set Access Token: "${v}"');
    await Prefs.setAccessToken(v);
  }

  void successLogin(v) {
    setAccessTokenToPrefs(v);
    Navigator.pushReplacementNamed(
      context,
      ProfileRoute,
    );
  }
}
