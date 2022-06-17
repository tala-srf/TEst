import 'package:ajyal/models/courses_model.dart';
import 'package:http/http.dart' as http;

import 'package:ajyal/service/config.dart';
import 'dart:convert';

class CoursesService {
  Future<CoursesModel> gatallcategorecourses(String token) async {
   if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
          Uri.parse('${ServiceConfig.base_url}/api/v1/categoriescourses'),
          headers: {'Authorization': 'Bearer $token'});
   Map<String, dynamic> userData =jsonDecode(utf8.decode(response.bodyBytes));
    CoursesModel course = CoursesModel.fromJson(userData);
     

      return course;
    }
  }
}
