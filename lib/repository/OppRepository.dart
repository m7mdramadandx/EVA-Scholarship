import 'package:eva_pharma/network//ApiProvider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();

  Future fetchOpp() => _apiProvider.retrieveScholarship();

  Future fetchUniversity() => _apiProvider.retrieveUniversity();

  Future searchScholarship(String query) =>
      _apiProvider.searchScholarship(query);
}
