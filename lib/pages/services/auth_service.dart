import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  Future login(String login, String password) async {
    print('login = ${login}, password = ${password}');
    final http.Response response = await http.post(
      Uri.parse("http://10.0.3.176:9999/api/auth/login"),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, String>{'email': login, 'password': password}),
    );

    print("response = ${response}");

    if (response != null && response.statusCode == 200) {
      var token = jsonDecode(response.body);
      print('token = ${token}');
      return token;
    }

    return null;
  }
}
