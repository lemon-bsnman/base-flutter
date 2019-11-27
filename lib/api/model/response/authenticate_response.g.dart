// GENERATED CODE - DO NOT MODIFY BY HAND

part of authenticate_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthenticateResponse> _$authenticateResponseSerializer =
    new _$AuthenticateResponseSerializer();

class _$AuthenticateResponseSerializer
    implements StructuredSerializer<AuthenticateResponse> {
  @override
  final Iterable<Type> types = const [
    AuthenticateResponse,
    _$AuthenticateResponse
  ];
  @override
  final String wireName = 'AuthenticateResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticateResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'access_token',
      serializers.serialize(object.access_token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthenticateResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthenticateResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'access_token':
          result.access_token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthenticateResponse extends AuthenticateResponse {
  @override
  final String access_token;

  factory _$AuthenticateResponse(
          [void Function(AuthenticateResponseBuilder) updates]) =>
      (new AuthenticateResponseBuilder()..update(updates)).build();

  _$AuthenticateResponse._({this.access_token}) : super._() {
    if (access_token == null) {
      throw new BuiltValueNullFieldError(
          'AuthenticateResponse', 'access_token');
    }
  }

  @override
  AuthenticateResponse rebuild(
          void Function(AuthenticateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticateResponseBuilder toBuilder() =>
      new AuthenticateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticateResponse && access_token == other.access_token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, access_token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthenticateResponse')
          ..add('access_token', access_token))
        .toString();
  }
}

class AuthenticateResponseBuilder
    implements Builder<AuthenticateResponse, AuthenticateResponseBuilder> {
  _$AuthenticateResponse _$v;

  String _access_token;
  String get access_token => _$this._access_token;
  set access_token(String access_token) => _$this._access_token = access_token;

  AuthenticateResponseBuilder();

  AuthenticateResponseBuilder get _$this {
    if (_$v != null) {
      _access_token = _$v.access_token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticateResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticateResponse;
  }

  @override
  void update(void Function(AuthenticateResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticateResponse build() {
    final _$result =
        _$v ?? new _$AuthenticateResponse._(access_token: access_token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
