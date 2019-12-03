import 'package:base_app/api/api.dart';
import 'package:base_app/api/model/model.dart';
import 'package:base_app/api/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class UserRepository {
  MyAPI _api;

  Future<User> me();
}

class APIUserRepository implements UserRepository {
  @override
  MyAPI _api;

  APIUserRepository._();

  APIUserRepository(this._api);

  @override
  Future<User> me() async {
    final result = await _api.userService.me();

    if (result.statusCode == 200) {
      final user = User.fromJson(result.body);

      return user;
    }
    throw NetworkError();
  }
}
