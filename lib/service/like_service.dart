
import 'package:ajyal/models/like_model.dart';

import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';
import 'dart:convert';



class LikeService {
  Future<LikeModel?> createlike(LikeModel create, String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.post(
          Uri.parse('${ServiceConfig.base_url}/api/v1/likes'),
          body: jsonEncode(create),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          });
   
        Map<String, dynamic> like1 =
            jsonDecode(utf8.decode(response.bodyBytes));
        LikeModel like = LikeModel.fromJson(like1);
       
        return like;
      
    }
  }
}