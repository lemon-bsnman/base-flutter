import 'package:base_app/api/api.dart';
import 'package:base_app/api/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class LoginRepository {
  MyAPI _api;

  Future<Authenticate> authenticate(String username, String password);
}

class FakeLoginRepository implements LoginRepository {
  MyAPI _api;

  FakeLoginRepository._();

  FakeLoginRepository(this._api);

  @override
  Future<Authenticate> authenticate(String username, password) {
    final response = Authenticate.fromJson("{\"access_token\": \"123\"}");

    return Future.delayed(Duration(seconds: 1), () {
      return response;
    });
  }
}

class APILoginRepository implements LoginRepository {
  MyAPI _api;

  APILoginRepository._();

  APILoginRepository(this._api);

  @override
  Future<Authenticate> authenticate(String username, password) async {
    debugPrint(username);
    debugPrint(password);

    try {
      final response = await _api.authService.authenticate(username, password);

      if (response.statusCode == 200) {
        final authenticate = Authenticate.fromJson(response.body);

        if (authenticate.accessToken == null) {
          throw NetworkError();
        }

        return authenticate;
      }
      return null;
    } on Error catch (err) {
      debugPrint(err.toString());
    } catch (e) {
      debugPrint("error on login $e");
    }
    throw NetworkError();
  }
}

class NetworkError extends Error {}
