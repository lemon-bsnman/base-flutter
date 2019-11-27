import 'package:base_app/api/model/response/authenticate_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class LoginRepository {
  Future<AuthenticateResponse> authenticate(String username, String password);
}

class FakeLoginRepository implements LoginRepository {
  @override
  Future<AuthenticateResponse> authenticate(String username, password) {
    final response =
        AuthenticateResponse.fromJson("{\"access_token\": \"123\"}");

    return Future.delayed(Duration(seconds: 1), () {
      return response;
    });
  }
}

class APILoginRepository implements LoginRepository {
  @override
  Future<AuthenticateResponse> authenticate(String username, password) async {
    final response = await http.get("https://authorization.optxdev.com/");

    if (response.statusCode == 200) {
      final authenticateResponse = AuthenticateResponse.fromJson(response.body);

      return authenticateResponse;
    }
    return null;
  }
}
