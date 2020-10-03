import 'package:eva_pharma/network//ApiProvider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();

  Future fetchOpp() => _apiProvider.getData();

  Future search() => _apiProvider.search();

  Future search2(String query) => _apiProvider.search2(query);
}
