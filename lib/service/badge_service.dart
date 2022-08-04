import 'package:ajyal/models/badge_model.dart';


import 'package:http/http.dart' as http;

import 'package:ajyal/service/config.dart';
import 'dart:convert';

class BadgeService {
  Future<BadgeModel> gatbadges(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
          Uri.parse('${ServiceConfig.base_url}api/v1/badges'),
          headers: {'Authorization': 'Bearer $token'});
   Map<String, dynamic> userData =jsonDecode(utf8.decode(response.bodyBytes));
      BadgeModel badge = BadgeModel.fromJson(userData);
     

      return badge;
    }
  }
}
