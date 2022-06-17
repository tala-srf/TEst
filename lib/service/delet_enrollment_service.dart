import 'dart:convert';

import 'package:ajyal/models/courses_model.dart';

import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';

class DeletEnrollmentService {
  Future<Enrollments>? deletEnrollment(String token, int id) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.delete(
          Uri.parse("${ServiceConfig.base_url}/api/v1/enrollments/$id"),
          headers: {'Authorization': 'Bearer $token'});
      Map<String, dynamic> deletData =
          jsonDecode(utf8.decode(response.bodyBytes));
      Enrollments? delet = Enrollments.fromJson(deletData);
      return delet;
    }
  }
}