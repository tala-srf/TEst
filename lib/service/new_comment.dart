// import 'package:http/http.dart' as http;
// import 'package:ajyal/models/post_model.dart';
// import 'package:ajyal/service/config.dart';
// import 'dart:convert';

// class NewCommentService {
//   Future<Comments> newcomment(String token, int id) async {
//     if (token == 'EMPTY_TOKEN') {
//       throw Exception();
//     } else {
//       http.Response response = await http.get(
//           Uri.parse('${ServiceConfig.base_url}/api/comments/$id'),
//           headers: {'Authorization': 'Bearer $token'});

//       Map<String, dynamic> userData =
//           jsonDecode(utf8.decode(response.bodyBytes));
//       Comments new1 = Comments.fromJson(userData);
//       return new1;
//     }
//   }
// }
