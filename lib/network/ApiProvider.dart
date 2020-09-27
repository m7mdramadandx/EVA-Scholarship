import 'dart:convert';

import 'package:eva_pharma/models/Place.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client _client = Client();
  final _baseURL = "https://jsonplaceholder.typicode.com/todos/1/";
  final _baseURL1 = "http://dummy.restapiexample.com/api/v1/employee/1";
  final _baseURL2 = "http://dummy.restapiexample.com/api/v1/employees";

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
