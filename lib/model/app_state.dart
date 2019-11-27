import 'package:flutter/material.dart';

class AppState {
  String profileName;

  AppState({@required this.profileName});

  AppState.fromAppState(AppState another){
    profileName = another.profileName;
  }

  String get viewProfileName => profileName;

}