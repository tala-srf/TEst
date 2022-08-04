import 'dart:convert';

import 'package:ajyal/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';

class DeletCommentService {
  Future<Comments>? deletComment(String token, int id) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.delete(
          Uri.parse("${ServiceConfig.base_url}api/v1/comments/$id"),
          headers: {'Authorization': 'Bearer $token'});
      Map<String, dynamic> deletData =
          jsonDecode(utf8.decode(response.bodyBytes));
      Comments? delet = Comments.fromJson(deletData);
      return delet;
    }
  }
}
