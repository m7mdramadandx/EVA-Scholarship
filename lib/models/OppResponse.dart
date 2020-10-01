import 'Place.dart';

class PlaceResponse {
  List<Place> parseResults(List<dynamic> list) {
    return list.map((i) => Place.fromJson(i)).toList();
  }
}
