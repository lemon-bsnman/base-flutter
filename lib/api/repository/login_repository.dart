import 'package:base_app/api/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

abstract class LoginRepository {
  Future<Authenticate> authenticate(String username, String password);
}

class FakeLoginRepository implements LoginRepository {
  @override
  Future<Authenticate> authenticate(String username, password) {
    final response = Authenticate.fromJson("{\"access_token\": \"123\"}");

    return Future.delayed(Duration(seconds: 1), () {
      return response;
    });
  }
}

class APILoginRepository implements LoginRepository {
  @override
  Future<Authenticate> authenticate(String username, password) async {
    debugPrint(username);
    debugPrint(password);
    debugPrint("magic");

    try {
      final response = await http.post(
        "https://authorization.optxdev.com/connect/token",
        headers: {'content-type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'password',
          'username': username,
          'password': password,
          'scope': 'openid api_full api.catalog_full',
          'client_id': '3D3N3YWLKM',
          'client_secret': ''
        },
      );

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
    }
    throw NetworkError();
  }
}

class NetworkError extends Error {}
