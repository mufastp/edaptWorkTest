import 'dart:developer';
import 'package:quiz_app/controller/url.dart';
import 'package:http/http.dart' as http;

import '../models/quizdatamodel.dart';

class ProviderService {
  getquestion(int? index,String type) async {
    final url = baseUrl+getquistion+index.toString()+"&difficulty="+type;
    log(url);
    final uri = Uri.parse(url);
     final response =
        await http.get(uri);
    log(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      return questionListFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}