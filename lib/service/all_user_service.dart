import 'package:http/http.dart' as http;
import 'package:ajyal/models/signin_model.dart';
import 'package:ajyal/service/config.dart';
import 'dart:convert';

class DataSignin {
  Future<List<DataUserModel>?> dataalluser(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
        Uri.parse('${ServiceConfig.base_url}/api/admin/users'),
        headers: {'Authorization': 'Bearer $token'},
      );
   List userData =jsonDecode(utf8.decode(response.bodyBytes)) as List;
     List<DataUserModel> data= userData.map((e) => DataUserModel.fromJson(e)).toList(growable: true);

      return data;
    }
  }
}