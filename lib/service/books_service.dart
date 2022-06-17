import 'package:ajyal/models/books_model.dart';

import 'package:http/http.dart' as http;

import 'package:ajyal/service/config.dart';
import 'dart:convert';

class BooksService {
  Future<BooksModel> gatallcategorybook(String token) async {
    if (token == 'EMPTY_TOKEN') {
      throw Exception();
    } else {
      http.Response response = await http.get(
          Uri.parse('${ServiceConfig.base_url}/api/v1/categoriesbooks'),
          headers: {'Authorization': 'Bearer $token'});
   Map<String, dynamic> userData =jsonDecode(utf8.decode(response.bodyBytes));
      BooksModel books = BooksModel.fromJson(userData);
     

      return books;
    }
  }
}
