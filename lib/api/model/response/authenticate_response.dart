library authenticate_response;

import 'dart:convert';

import 'package:base_app/api/model/serializer/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticate_response.g.dart';

abstract class AuthenticateResponse
    implements Built<AuthenticateResponse, AuthenticateResponseBuilder> {
  String get access_token;

  AuthenticateResponse._();

  factory AuthenticateResponse([updates(AuthenticateResponseBuilder b)]) =
      _$AuthenticateResponse;

  String toJson() {
    return json.encode(
        serializers.serializeWith(AuthenticateResponse.serializer, this));
  }

  static AuthenticateResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthenticateResponse.serializer, json.decode(jsonString));
  }

  static Serializer<AuthenticateResponse> get serializer =>
      _$authenticateResponseSerializer;
}
