import 'package:ajyal/models/new_account_model.dart';
import 'package:http/http.dart' as http;

import 'package:ajyal/service/config.dart';
import 'dart:convert';

class NewAccountService {
  Future<NewAccountModel?> createaccount(NewAccountModel account ,) async {
    http.Response response = await http.post(
        Uri.parse("${ServiceConfig.base_url}api/v1/register"),
        body: jsonEncode(account),
        headers: {
          'Content-Type': 'application/json',
         

        });

    if (response.statusCode == 201) {
     Map<String, dynamic> userData =
            jsonDecode(utf8.decode(response.bodyBytes));
        NewAccountModel account1 = NewAccountModel.fromJson(userData);
 
      return account1;

  
    } else if (response.statusCode == 400) {
      null;
    }
  }
 
}
