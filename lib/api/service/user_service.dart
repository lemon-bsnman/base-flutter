import 'package:base_app/prefs/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class UserServiceUserCase {
  Future<Response> me();
}

class UserService extends UserServiceUserCase {
  final http.Client _client;

  UserService(this._client);

  @override
  Future<Response> me() async {
    final accessToken = await Prefs.accessToken;
    return _client.post("https://api.optxdev.com/me",
        headers: {"Authorization": "Bearer $accessToken"});
  }
}
