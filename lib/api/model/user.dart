library user;

import 'dart:convert';

import 'package:base_app/api/model/serializer/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  @BuiltValueField(wireName: "department_id")
  int get departmentId;

  String get email;
  String get employeeId;
  String get firstName;
  String get fullName;
  String get id;
  String get lastName;
  String get middleName;
  String get role;
  String get simplifiedName;
  String get userName;

  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
        User.serializer, json.decode(jsonString));
  }

  static Serializer<User> get serializer => _$userSerializer;
}
