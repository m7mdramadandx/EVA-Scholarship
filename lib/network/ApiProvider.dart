import 'dart:convert';

import 'package:eva_pharma/models/OppResponse.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client _client = Client();
  final baseURL = "http://franskmenne-001-site1.itempurl.com/api/scholarship";
  final searchBaseURL =
      "http://franskmenne-001-site1.itempurl.com/api/university";
  final _baseURL2 = "http://dummy.restapiexample.com/api/v1/employees";

  Future getData() async {
    final response = await _client.get('$baseURL');
    print('Calling API');

    if (response.statusCode == 200) {
      return OppResponse.parseOpportunities(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future search() async {
    final response = await _client.get('$searchBaseURL');
    print('Calling Search API');

    if (response.statusCode == 200) {
      print(response.body);
      return OppResponse.parseUniversities(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future search2(String query) async {
    final response = await _client.get('$searchBaseURL$query');
    print('Success');

    if (response.statusCode == 200) {
      return OppResponse.parseUniversities(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
