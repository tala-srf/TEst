import 'package:ajyal/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';
import 'dart:convert';



class CommentService {
  Future<Comments?> createcomment(Comments create, String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.post(
          Uri.parse('${ServiceConfig.base_url}/api/comments'),
          body: jsonEncode(create),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          });
   
        Map<String, dynamic> userData =
            jsonDecode(utf8.decode(response.bodyBytes));
        Comments comment1 = Comments.fromJson(userData);
       
        return comment1;
      
    }
  }
}
