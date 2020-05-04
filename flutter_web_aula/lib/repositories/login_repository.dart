import 'dart:convert';
import 'package:flutter_web_aula/models/user.dart';
import 'package:flutter_web_aula/utils/api_response.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  store(String login, String password) async {
    try {
      String url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {'Content-Type': 'application/json'};

      String body = json.encode({
        'username': login,
        'password': password,
      });

      final response = await http.post(url, body: body, headers: headers);

      Map decodedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = User.fromJson(decodedResponse);
        return ApiResponse.ok(result: user);
      }

      return ApiResponse.error(message: decodedResponse['error']);
    } catch (error, exception) {
      return ApiResponse.error(message: 'Não foi possível fazer o login');
    }
  }
}