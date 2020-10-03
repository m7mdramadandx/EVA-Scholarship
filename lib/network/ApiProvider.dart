import 'dart:convert';

import 'package:eva_pharma/models/OppResponse.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client _client = Client();
  final scholarshipURL =
      "http://franskmenne-001-site1.itempurl.com/api/scholarship";
  final universityURL =
      "http://franskmenne-001-site1.itempurl.com/api/university";
  final searchScholarshipURL =
      "http://franskmenne-001-site1.itempurl.com/api/scholarship/universityId/";

  Future retrieveScholarship() async {
    final response = await _client.get('$scholarshipURL');
    print('Calling scholarship API');

    if (response.statusCode == 200) {
      return OppResponse.parseOpportunities(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future retrieveUniversity() async {
    final response = await _client.get('$universityURL');
    print('Calling university API');

    if (response.statusCode == 200) {
      return OppResponse.parseUniversities(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future searchScholarship(String query) async {
    final response = await _client.get('$searchScholarshipURL$query');
    print('Calling search API');

    if (response.statusCode == 200) {
      return OppResponse.parseOpportunities(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
