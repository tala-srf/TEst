import 'dart:convert';

import 'package:ajyal/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';

class DeletLikeService {
  Future<Likes>? deletlike(String token, int id) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.delete(
          Uri.parse("${ServiceConfig.base_url}api/v1/likes/$id"),
          headers: {'Authorization': 'Bearer $token'});
      Map<String, dynamic> deletData =
          jsonDecode(utf8.decode(response.bodyBytes));
      Likes? delet = Likes.fromJson(deletData);
      return delet;
    }
  }
}