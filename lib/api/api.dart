import 'package:base_app/api/service/services.dart';
import 'package:http/http.dart' as http;

abstract class API {
  http.Client client;
  AuthService authService;
}

class MyAPI implements API {
  static http.Client _client = http.Client();

  static MyAPI api = MyAPI(MyAPI._client);

  http.Client client;
  AuthService authService;

  MyAPI(http.Client client) {
    this.client = client;

    this.authService = AuthService(client);
  }
}
