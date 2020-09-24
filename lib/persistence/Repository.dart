import 'package:eva_pharma/models/Place.dart';
import 'package:eva_pharma/persistence/ApiProvider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();

  Future<Place> fetchLondonWeather() => _apiProvider.getData();
}
