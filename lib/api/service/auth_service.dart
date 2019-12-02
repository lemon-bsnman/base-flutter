import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class AuthUseCase {
  Future<Response> authenticate(String username, String password);
}

class AuthService extends AuthUseCase {
  final http.Client _client;

  AuthService(this._client);

  @override
  Future<Response> authenticate(String username, String password) {
    return _client.post(
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
  }
}
