import 'package:ajyal/models/enrollment_model.dart';

import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';
import 'dart:convert';



class EnrollmentService {
  Future<EnrollmentModel?> enrollment(EnrollmentModel create, String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.post(
          Uri.parse('${ServiceConfig.base_url}/api/v1/enrollments'),
          body: jsonEncode(create),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          });
   
        Map<String, dynamic> enrollment1 =
            jsonDecode(utf8.decode(response.bodyBytes));
        EnrollmentModel enrollment = EnrollmentModel.fromJson(enrollment1);
       
        return enrollment;
      
    }
  }
}
