import 'package:ajyal/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';
import 'dart:convert';

class PostService {
  Future<List<PostModel>> getallpost(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
          Uri.parse('${ServiceConfig.base_url}/api/posts'),
          headers: {'Authorization': 'Bearer $token'});

      List posts = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      return posts.map((e) => PostModel.fromJson(e)).toList(growable: true);
    }
  
  }


 
}
