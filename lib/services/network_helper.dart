import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper{

  Future getData({String url}) async {

    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      Map jsonData = jsonDecode(data);
      print(jsonData);
      return jsonData;
    } else {
      print(response.statusCode);
    }
  }
}