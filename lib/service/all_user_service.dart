import 'package:ajyal/models/top_three_model.dart';
import 'package:http/http.dart' as http;

import 'package:ajyal/service/config.dart';
import 'dart:convert';

class DataSignin {
  Future<List<TopModel>?> datatop(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
        Uri.parse('${ServiceConfig.base_url}/api/v1/top-ten'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      List userData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      List bookbadge = userData[0];
      List coursebadge = userData[1];

      List<TopModel> data =
          bookbadge.map((e) => TopModel.fromJson(e)).toList(growable: true);
            List<TopModel> data1 =
          coursebadge.map((e) => TopModel.fromJson(e)).toList(growable: true);

      return data;
    }
  }
   Future<List<TopModel>?> datatopcourse(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
        Uri.parse('${ServiceConfig.base_url}/api/v1/top-ten'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      List userData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      List bookbadge = userData[0];
      List coursebadge = userData[1];

      List<TopModel> data =
          bookbadge.map((e) => TopModel.fromJson(e)).toList(growable: true);
            List<TopModel> data1 =
          coursebadge.map((e) => TopModel.fromJson(e)).toList(growable: true);

      return data1;
    }
  }
}
