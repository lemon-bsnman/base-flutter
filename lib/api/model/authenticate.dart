library authenticate;

import 'dart:convert';

import 'package:base_app/api/model/serializer/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticate.g.dart';

abstract class Authenticate
    implements Built<Authenticate, AuthenticateBuilder> {
  @BuiltValueField(wireName: "access_token")
  String get accessToken;

  @BuiltValueField(wireName: "expires_in")
  int get expiresIn;

  String get scope;

  @BuiltValueField(wireName: "token_type")
  String get tokenType;

  Authenticate._();

  factory Authenticate([updates(AuthenticateBuilder b)]) = _$Authenticate;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Authenticate.serializer, this));
  }

  static Authenticate fromJson(String jsonString) {
    return serializers.deserializeWith(
        Authenticate.serializer, json.decode(jsonString));
  }

  static Serializer<Authenticate> get serializer => _$authenticateSerializer;
}
