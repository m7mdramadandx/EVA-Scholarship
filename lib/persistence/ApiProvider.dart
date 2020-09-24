import 'dart:convert';

import 'package:eva_pharma/models/Place.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client _client = Client();
  final _baseURL = "https://jsonplaceholder.typicode.com/todos/1/";

  Future<Place> getData() async {
    final response = await _client.get('$_baseURL');
    print(response.body.toString());

    if (response.statusCode == 200) {
      return Place.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
