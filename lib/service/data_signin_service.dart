import 'package:ajyal/models/signin_model.dart';
import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';
import 'dart:convert';

class DataSignin {
  Future<DataUserModel> datauser1(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
        Uri.parse('${ServiceConfig.base_url}/api/v1/profile/'),
        headers: {'Authorization': 'Bearer $token'},
      );
      Map<String, dynamic> userData =jsonDecode(utf8.decode(response.bodyBytes));
      DataUserModel data = DataUserModel.fromJson(userData);

      return data;
    }
  }
}
