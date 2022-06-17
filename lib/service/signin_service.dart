import 'dart:convert';

import 'package:ajyal/models/me.dart';

import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';

class SignInService {
  Future<AuthModel?> authUser(
    AuthModel usermodel,
  ) async {
    http.Response response = await http.post(
      Uri.parse('${ServiceConfig.base_url}/api/v1/login'),
      body: jsonEncode(usermodel),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      String? token =
          (jsonDecode(response.body) as Map<String, dynamic>)['token'];
      usermodel.token = token;
      return usermodel;
    } else
      return null;
  }
}
