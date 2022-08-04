

import 'package:ajyal/models/finished_lecture_model.dart';
import 'package:http/http.dart' as http;
import 'package:ajyal/service/config.dart';
import 'dart:convert';



class FinishedLectureService {
  Future<FinishedLectureModel?> finishedservice(FinishedLectureModel create, String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.post(
          Uri.parse('${ServiceConfig.base_url}api/v1/finished_lecture'),
          body: jsonEncode(create),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          });
   
        Map<String, dynamic> finished =
            jsonDecode(utf8.decode(response.bodyBytes));
        FinishedLectureModel finishedl = FinishedLectureModel.fromJson(finished);
       
        return finishedl;
      
    }
  }
}