// import 'dart:convert';

// import 'package:ajyal/models/post_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:ajyal/service/config.dart';

// class UpDataPost {
//   Future<PostModel?> updatacomment(
//       PostModel create, String token, int id) async {
//     if (token == 'EMPTY_TOKEN') {
//       throw Exception();
//     } else {
//       http.Response response = await http.patch(
//         Uri.parse('${ServiceConfig.base_url}/api/posts/$id'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//         body: jsonEncode(create),
//       );
//       if (response.statusCode == 200) {
//         Map<String, dynamic> s = jsonDecode(utf8.decode(response.bodyBytes));
//         PostModel? comment = PostModel.fromJson(s);
//         return comment;
//       } else if (response.statusCode == 400) {
//         return null;
//       }
//     }
//   }
// }
