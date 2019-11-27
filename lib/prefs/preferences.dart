import 'dart:async';

import 'preferences_base.dart';

class Prefs {
  static Future<String> get accessToken => PreferencesHelper.getString(Const.ACCESSTOKEN);

  static Future setAccessToken(String value) => PreferencesHelper.setString(Const.ACCESSTOKEN, value);

  static Future<void> clear() async {
    await Future.wait(<Future>[
      setAccessToken(''),
    ]);
  }
}

class Const {
  static const String ACCESSTOKEN = 'ACCESSTOKEN';
}