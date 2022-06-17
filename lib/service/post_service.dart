import 'package:ajyal/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';
import 'dart:convert';

class PostService {
  Future<PostModel> getallpost(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
          Uri.parse('${ServiceConfig.base_url}/api/v1/posts'),
          headers: {'Authorization': 'Bearer $token'});
 Map<String, dynamic> userData =jsonDecode(utf8.decode(response.bodyBytes));
      PostModel posts = PostModel.fromJson(userData);
     

      return posts;
    }
  }
}
